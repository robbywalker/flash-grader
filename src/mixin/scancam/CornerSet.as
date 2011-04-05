package mixin.scancam {
	
	import flash.display.Graphics;
	
	public class CornerSet {

		private var corners:Array = [];
		
		public function CornerSet() {
		}
		
		public function getCount():int {
			return corners.length;
		}
		
		public function add(corner:Corner):void {
			for (var i:int = 0; i < corners.length; i++) {
				if (corners[i].containsPoint(corner.center, corner.middle)) {
					return;
				}
			}
			corners.push(corner);
		}
		
		public function getPaper():Paper {
			if (corners.length != 4) {
				return null;
			}
			
			corners.sort(function(a:Corner, b:Corner):int {
				return a.middle - b.middle;
			});
			
			var topOrder:Boolean = corners[0].center < corners[1].center;
			var bottomOrder:Boolean = corners[2].center < corners[3].center;
			
			return new Paper(
				topOrder ? corners[0] : corners[1],
				topOrder ? corners[1] : corners[0],
				bottomOrder ? corners[2] : corners[3],
				bottomOrder ? corners[3] : corners[2]);			
		}
		
		public function draw(graphics:Graphics):void {
			for (var i:int = 0; i < corners.length; i++) {
				corners[i].draw(graphics);
			}
		}		
	}
}