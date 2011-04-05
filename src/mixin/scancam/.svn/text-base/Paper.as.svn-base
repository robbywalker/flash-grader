package mixin.scancam {

	import flash.display.BitmapData;
	import flash.display.Graphics;
	
	import mixin.math;

	public class Paper {
		private var topLeft:Corner;
		
		private var topRight:Corner;
		
		private var bottomLeft:Corner;
		
		private var bottomRight:Corner;
		
		public function Paper(topLeft:Corner, topRight:Corner, bottomLeft:Corner, bottomRight:Corner) {
			this.topLeft = topLeft;
			this.topRight = topRight;
			this.bottomLeft = bottomLeft;
			this.bottomRight = bottomRight;
		}
		
		public function draw(graphics:Graphics):void {
			graphics.lineStyle(2, 0x7f00ff00);
			graphics.moveTo(topLeft.center, topLeft.middle);
			graphics.lineTo(topRight.center, topRight.middle);
			graphics.lineTo(bottomRight.center, bottomRight.middle);
			graphics.lineTo(bottomLeft.center, bottomLeft.middle);
			graphics.lineTo(topLeft.center, topLeft.middle);
			
			drawBubbles(graphics, 0.25);
			drawBubbles(graphics, 0.5);
			drawBubbles(graphics, 0.75);
		}
		
		public function drawBubbles(graphics:Graphics, rowOffset:Number):void {			
			var leftX:Number = mixin.math.perspectiveLerp(
				topLeft.center, topLeft.getSize(),
				bottomLeft.center, bottomLeft.getSize(),
				rowOffset);
			var leftY:Number = mixin.math.perspectiveLerp(
				topLeft.middle, topLeft.getSize(),
				bottomLeft.middle, bottomLeft.getSize(),
				rowOffset);
			var leftSize:Number = 1.0 / mixin.math.perspectiveLerp(
				1.0 / topLeft.getSize(), topLeft.getSize(),
				1.0 / bottomLeft.getSize(), bottomLeft.getSize(),
				rowOffset);
				
			var rightX:Number = mixin.math.perspectiveLerp(
				topRight.center, topRight.getSize(),
				bottomRight.center, bottomRight.getSize(),
				rowOffset);
			var rightY:Number = mixin.math.perspectiveLerp(
				topRight.middle, topRight.getSize(),
				bottomRight.middle, bottomRight.getSize(),
				rowOffset);
			var rightSize:Number = 1.0 / mixin.math.perspectiveLerp(
				1.0 / topRight.getSize(), topRight.getSize(),
				1.0 / bottomRight.getSize(), bottomRight.getSize(),
				rowOffset);
			
			var t:int = -9;
			for (var i:int = 0; i < 4; i++) {				
				var tFloat:Number = t / 117.0;
				graphics.moveTo(
					Math.round(mixin.math.perspectiveLerp(
						leftX, leftSize, rightX, rightSize, tFloat)),
					Math.round(mixin.math.perspectiveLerp(
						leftY, leftSize, rightY, rightSize, tFloat)));
					
				t += 24;
				tFloat = t / 117.0;
				graphics.lineTo(
					Math.round(mixin.math.perspectiveLerp(
						leftX, leftSize, rightX, rightSize, tFloat)),
					Math.round(mixin.math.perspectiveLerp(
						leftY, leftSize, rightY, rightSize, tFloat)));
					
				t += 13;
			}
		}
		
		public function scan(pixels:BitmapData, rowOffset:Number):String {
			var leftX:Number = mixin.math.lerp(topLeft.center, bottomLeft.center, rowOffset); 
			var leftY:Number = mixin.math.lerp(topLeft.middle, bottomLeft.middle, rowOffset);
			
			var rightX:Number = mixin.math.lerp(topRight.center, bottomRight.center, rowOffset);
			var rightY:Number = mixin.math.lerp(topRight.middle, bottomRight.middle, rowOffset);
			
			var totals:Array = [];
			var t:int = -18;
			for (var i:int = 0; i < 4; i++) {
				var total:int = 0;
				for (var count:int = 0; count < 48; count++, t++) {
					var tFloat:Number = t / 234.0;
					var pointX:int = Math.round(mixin.math.lerp(leftX, rightX, tFloat));
					var pointY:int = Math.round(mixin.math.lerp(leftY, rightY, tFloat));
					
					if (pixels.getPixel(pointX, pointY) == 0) {
						total++;
					}					 	
				}
				t += 26;
				totals.push(total);
			}
			
			var best:int = -1;
			var plausibleCount:int = 0;
			for (i = 0; i < 4; i++) {
				if (totals[i] > 25) {
					plausibleCount++;
					if (totals[i] > 35) {
						best = i;
					}
				}
			}
			if (plausibleCount > 1) {
				return 'X';
			}
			
			return best == -1 ? null : ['A', 'B', 'C', 'D'][best];
		}
	}
}