package
{
    import appManager.displayContent.SliderElementInterface;
    import flash.geom.Rectangle;
    import flash.display.MovieClip;
    import flash.utils.setTimeout;

    public class SliderElement extends SliderElementInterface
    {
        private var backMC:MovieClip ;

        private var scrollMC:MovieClip ;

        public function SliderElement()
        {
            super();
            backMC = Obj.get("back_mc",this);
            scrollMC = Obj.get("scroll_MC",this);

            setTimeout(setUp2,100);
        }

        override public function setUp(data:*, area:Rectangle, myIndex:int):void
        {
            setUp2();
        }

        private function setUp2():void
        {
            new ScrollMT(scrollMC,new Rectangle(0,0,backMC.width,scrollMC.height),null,false,true);
        }

        override public function get width():Number
        {
            return backMC.width ;
        }
    }
}