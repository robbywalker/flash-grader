package mixin.scancam {

	import flash.display.Graphics;
	
	public class Corner {

		public var left:int;
		
		public var center:int;
		
		public var width:int;
		
		public var top:int;
		
		public var middle:int;
		
		public var height:int;
		
		public function Corner() {
		}
		
		public function containsPoint(x:int, y:int):Boolean {
			return x >= left && x <= left + width &&
				y >= top && y <= top + height;
		}

		public function draw(graphics:Graphics):void {
			graphics.beginFill(0x0000ff, 0.3);
			graphics.drawRect(left, top, width, height);
			graphics.endFill();
		}
		
		public function getSize():Number {
			return (width + height) / 2.0;
		}
	}
}