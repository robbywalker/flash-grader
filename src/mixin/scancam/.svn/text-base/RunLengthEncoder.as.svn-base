package mixin.scancam
{
	public class RunLengthEncoder
	{
		private var first:Boolean = true;
		
		private var runs:Array = [];
		
		private var currentIsBlack:Boolean;
		
		private var runLength:int = 1;
		
		public function RunLengthEncoder()
		{
		}
		
		public function handlePixel(pixel:uint):void {
			if (first) {
				currentIsBlack = pixel == 0;
	  			if (!currentIsBlack) {
  					runs.push(0);
  				}
				first = false;	
			} else {
  				var isBlack:Boolean = pixel == 0;
  				if (isBlack == currentIsBlack) {
  					runLength++;
  				} else {
  					runs.push(runLength);
  					runLength = 1;
  				}
  				currentIsBlack = isBlack;				
			}
		}
		
		public function getResult():Array {
			if (runLength) {
				runs.push(runLength);
				runLength = 0;				
			}
  			
  			return runs;
		}

	}
}