package
{
	import appManager.displayContentElemets.TextParag;
	
	import flash.display.Sprite;
	
	public class testAlign extends Sprite
	{
		public function testAlign()
		{
			super();
			
			var T1:TextParag = Obj.get("t1",this);
			var T2:TextParag = Obj.get("t2",this);
			var T3:TextParag = Obj.get("t3",this);
			
			T1.setUp('س',true,true,false,false,false,false,false,false,false,true);
			T2.setUp('-\n-',true,true,false,false,false,false,false,false,false,true);
			T3.setUp('بدل\nآل\nبد',true,true,false,false,false,false,false,false,false,true);
		}
	}
}