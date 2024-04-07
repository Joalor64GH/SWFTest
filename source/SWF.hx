package;

import openfl.display.Sprite;
import openfl.display.Loader;
import openfl.events.Event;

/**
 * A simple SWF loader.
 * @author Joalor64GH
 */

class SWF extends Sprite
{
    private var loader:Loader;
    private var swfContent:Sprite;
    
    private var callback:Void -> Void;

    /**
     * Creates a new instance of the SWF class.
     * @param swfPath The path of the file to load.
     * @param callback The function to be called when the swf is loaded and finished playing.
     */

    public function new(swfPath:String, callback:Void -> Void)
    {
        super();

        this.callback = callback;

        loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
        loader.load(new openfl.net.URLRequest(swfPath));
    }

    /**
     * Event handler called when the file finished loading.
     * @param event The Event object.
     */

    private function onLoadComplete(event:Event):Void
    {
        swfContent = cast(loader.content, Sprite);
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
            removeEventListener(Event.ENTER_FRAME, checkAnimationComplete);
            callback(this);
        }
    }
}