package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author ©2015-2016 Vadim Ledyaev 
	 */
	public class Main extends Sprite 
	{
		private var starling:Starling;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			starling = new Starling(TestBed, stage)
			starling.start()
			starling.showStatsAt(HAlign.LEFT, VAlign.TOP, 2)
		}
	}
}