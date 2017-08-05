var grunt=require('grunt');

//配置
grunt.config.init({
    pkg: grunt.file.readJSON('gruntPackage.json'),
    'create-windows-installer': {
        x64:{
            version:'1.0.1',
            authors:'autoUpdate',
            projectUrl:'',
            appDirectory:'./outapp/autoUpdate-win32-x64',//要打包的输入目录
            outputDirectory:'./output',//grunt打包后的输出目录
            exe:'autoUpdate.exe',
            description:'autoUpdate',
            setupIcon:"./build/icon.ico",
            noMsi:true
        }
    }
});

//加载任务
grunt.loadNpmTasks('grunt-electron-installer');

//设置为默认
grunt.registerTask('default', ['create-windows-installer']);