
require("config")
require("cocos.init")
require("framework.init")


local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
	math.randomseed(os.time()) 
    cc.FileUtils:getInstance():addSearchPath("res/")
    display.addSpriteFrames(GAME_TEXTURE_DATA_FILENAME, GAME_TEXTURE_IMAGE_FILENAME)
    self:enterScene("MainScene")
end


function MyApp:onEnterBackground()
    audio.pauseAllSounds()
    audio.pauseMusic()
    cc.Director:getInstance():pause()
end

function MyApp:onEnterForeground()
    audio.resumeAllSounds()
    audio.resumeMusic()
    cc.Director:getInstance():resume()
end
return MyApp
