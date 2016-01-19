package  
{
	import com.flarling.animation.Flarling;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.Security;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setTimeout;
	import starling.core.Starling;
	import starling.events.*;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author Vadim Ledyaev ©2015
	 */
	public class AssetMan extends AssetManager
	{
		public static var INSTANCE:AssetMan = new AssetMan();
		public static var progressCallback:Function;
		public var pivots:Dictionary = new Dictionary();
		
		public function AssetMan() 
		{
			super(1, true);
			
			super.verbose = true;
			super.keepAtlasXmls = true;
			super.keepFontXmls = true;
		}
		
		static public function parsePivots():void 
		{
			var xmlNames:Vector.<String> = INSTANCE.getXmlNames();
			var currentXML:XML, name:String, subTexture:XML, subTextureName:String, pivotX:Number, pivotY:Number;
			var xmlName:String, newFontArray:Array,  currentFontFace:String, itemData:XML, currentXMLElements:XMLList, fontXMLName:String, charData:XML, charItemElements:XMLList
			
			for each(xmlName in xmlNames)
			{
				currentXML = INSTANCE.getXml(xmlName);
				
				if (currentXML.name() != 'font')
				{
					//GETTING TEXTURES PIVOTS..
					for each (subTexture in currentXML.SubTexture)
					{
						name       	= subTexture.attribute("name");
						pivotX     	= parseFloat(subTexture.attribute("pivotX"));
						pivotY      = parseFloat(subTexture.attribute("pivotY"));
						INSTANCE.pivots[name]= new Point(pivotX, pivotY);
						if (pivotX) INSTANCE.pivots[name].x = pivotX;
						if (pivotY) INSTANCE.pivots[name].y = pivotY;
					}
				}
			}
		}
		
		public static function getImage(id:String):Image
		{
			var texture:Texture = INSTANCE.getTexture(id);
			if (!texture) texture = Flarling.missingTexture;
			var result:Image = new Image(texture);
			
			if (INSTANCE.pivots[id])
			{
				result.pivotX = INSTANCE.pivots[id].x;
				result.pivotY = INSTANCE.pivots[id].y;
			}else {
				result.alignPivot();
			}
			
			return result;
		}
	}
}