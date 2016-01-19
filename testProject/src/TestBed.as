package 
{
	import com.flarling.animation.Flarling;
	import com.flarling.animation.FlarlingAnimation;
	import flash.display.BitmapData;
	import starling.display.*;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.*;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author ©2015-2016 Vadim Ledyaev 
	 */
	public class TestBed extends Sprite 
	{
		[Embed(source = "../lib/testProject.png")]
		public static const testProject:Class;
		
		[Embed(source = "../lib/testProject.xml", mimeType = "application/octet-stream")]
		public static const testProjectXML:Class;
		
		[Embed(source = "../lib/testProject.json", mimeType = "application/octet-stream")]
		public static const animationsObject:Class;
		
		private var assets:AssetManager
		private var tf:TextField
		private var n:int
		
		public function TestBed() 
		{
			super();
			
			tf = new TextField(128, 32, '000');
			tf.fontSize = 40
			tf.hAlign = HAlign.RIGHT
			tf.color = 0xFFFFFF
			tf.alignPivot(HAlign.RIGHT, VAlign.TOP);
			tf.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS
			addChild(tf);
			
			AssetMan.INSTANCE.enqueue(TestBed)
			AssetMan.INSTANCE.loadQueue(onAssetsProgress)
		}
		
		private function onAssetsProgress(ratio:Number):void 
		{
			if (ratio == 1) {
				AssetMan.parsePivots();
				init()
			}
		}
		
		private function init():void 
		{
			Flarling.assetManager = AssetMan.INSTANCE;
			var convertedAnimations:Object = AssetMan.INSTANCE.getObject('animationsObject');
			Flarling.addAnimations(convertedAnimations);
			
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
			tf.x = stage.stageWidth
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			if (e.getTouch(stage, TouchPhase.ENDED))
			{
				var animation:FlarlingAnimation = Flarling.getAnimation('animation_1');
				animation.gotoAndPlay('walk');
				addChild(animation);
				animation.x = Math.random() * stage.stageWidth;
				animation.y = Math.random() * stage.stageHeight;
				animation.scaleX = animation.scaleY = 0.2;
				animation.rotation = Math.random() * 6;
				
				animation = Flarling.getAnimation('animation_0');
				addChild(animation);
				animation.gotoAndPlay('anim_id_1');
				animation.x = Math.random() * stage.stageWidth;
				animation.y = Math.random() * stage.stageHeight;
				animation.scaleX = animation.scaleY = 0.2;
				animation.rotation = Math.random() * 6;
				
				n += 2
				tf.text = String(n)
			}
		}
	}
}