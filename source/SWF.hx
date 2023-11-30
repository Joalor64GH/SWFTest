package;

import openfl.display.Loader;
import openfl.events.Event;
import flixel.FlxSprite;

/**
 * A simple SWF loader.
 * @author Joalor64GH
 */

class SWF extends FlxSprite
{
    private var loader:Loader;
    private var swfContent:FlxSprite;
    
    private var callback:Dynamic -> Void;

    /**
     * Creates a new instance of the SWF class.
     * @param swfPath The path of the file to load.
     * @param callback The function to be called when the swf is loaded and finished playing.
     */

    public function new(swfPath:String, callback:Dynamic -> Void)
    {
        super();

        this.callback = callback;

        loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
        loader.load(new URLRequest(swfPath));
    }

    /**
     * Event handler called when the file finished loading.
     * @param event The Event object.
     */

    private function onLoadComplete(event:Event):Void
    {
        swfContent = cast(loader.content, FlxSprite);
        loadGraphic(swfContent);
        addEventListener(Event.ENTER_FRAME, checkAnimationComplete);
    }

    /**
     * Event handler called on each frame to check if the animation has finished playing.
     * @param event The Event object.
     */

    private function checkAnimationComplete(event:Event):Void
    {
        if (swfContent.currentFrame == swfContent.frames) {
            removeEventListener(EVent.ENTER_FRAME, checkAnimationComplete);
            callback(this);
        }
    }
}