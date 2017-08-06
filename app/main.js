const electron = require('electron');
const path = require('path');
  // Module to control application life.
const app = electron.app;
  // Module to create native browser window.
const BrowserWindow = electron.BrowserWindow;
const ipcMain = electron.ipcMain;
const dialog = electron.dialog;
// const globalShortcut = electron.globalShortcut;
const autoUpdater = require("electron-updater").autoUpdater;

autoUpdater.setFeedURL('http://127.0.0.1:8080/');
// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let mainWindow

// 在渲染进程打印信息
function sendStatusToWindow(text) {
  mainWindow.webContents.send('message', text);
}

//自动更新
function startupEventHandle(){
  if(!require('electron-squirrel-startup')) return;
  var handleStartupEvent = function () {
    if (process.platform !== 'win32') {
      return false;
    }
    var squirrelCommand = process.argv[1];
    switch (squirrelCommand) {
      case '--squirrel-install':
      case '--squirrel-updated':
        install();
        return true;
      case '--squirrel-uninstall':
        uninstall();
        app.quit();
        return true;
      case '--squirrel-obsolete':
        app.quit();
        return true;
    }
      // 安装
    function install() {
      var cp = require('child_process');    
      var updateDotExe = path.resolve(path.dirname(process.execPath), '..', 'update.exe');
      var target = path.basename(process.execPath);
      var child = cp.spawn(updateDotExe, ["--createShortcut", target], { detached: true });
      child.on('close', function(code) {
          app.quit();
      });
    }
    // 卸载
    function uninstall() {
      var cp = require('child_process');    
      var updateDotExe = path.resolve(path.dirname(process.execPath), '..', 'update.exe');
      var target = path.basename(process.execPath);
      var child = cp.spawn(updateDotExe, ["--removeShortcut", target], { detached: true });
      child.on('close', function(code) {
          app.quit();
      });
    }
  };
  if (handleStartupEvent()) {
    return ;
  }
}
// 注册自动更新事件
function initAutoUpdate(){
  let appName='autoUpdater';

  autoUpdater.on('error', function(error){
    mainWindow.webContents.send('hideUpldateLoading',false);
    sendStatusToWindow('检查更新出错');
  })
  .on('checking-for-update', function(e) {
      mainWindow.webContents.send('hideUpldateLoading',true);
      sendStatusToWindow('正在检查更新……');
  })
  .on('update-available', function(e) {
      sendStatusToWindow('下载更新成功');
  })
  .on('update-not-available', function(e) {
    mainWindow.webContents.send('hideUpldateLoading',false);
    sendStatusToWindow('现在使用的就是最新版本，不用更新');
  })
  .on('update-downloaded',  function (event, releaseNotes, releaseName, releaseDate, updateUrl, quitAndUpdate) {
      
      var index = dialog.showMessageBox(mainWindow, {
          type: 'info',
          buttons: ['现在重启','稍后重启'],
          title: appName,
          message: '最新版本已下载，将在重启程序后更新',
          detail: releaseName + "/n/n" + releaseNotes
      });
      if (index === 1) return;
      force_quit = true;
      autoUpdater.quitAndInstall();
  });
}
// 注册触发更新事件
function updateHandle(){
  ipcMain.on('check-for-update', function(event, arg) {      
      autoUpdater.checkForUpdates();
  });
}

function createWindow() {
  // Create the browser window.
  mainWindow = new BrowserWindow({
    width: 1000,
    height: 700
  })

  // and load the index.html of the app.
  mainWindow.loadURL(`file://${__dirname}/index.html#v${app.getVersion()}`)

  // Open the DevTools.
  mainWindow.webContents.openDevTools()

  // Emitted when the window is closed.
  mainWindow.on('closed', function() {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    mainWindow = null
  });
}


// startupEventHandle();

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.on('ready', function(){
  createWindow();
  initAutoUpdate();
  updateHandle();
});

// Quit when all windows are closed.
app.on('window-all-closed', function() {
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit()
  }
})

app.on('activate', function() {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) {
    createWindow()
  }
});

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.
