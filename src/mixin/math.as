package mixin {
	public class math {
		public static function lerp(v1:Number, v2:Number, t:Number):Number {
			return v1 * (1.0 - t) + v2 * t;
		}
		
		public static function perspectiveLerp(v1:Number, size1:Number, v2:Number, size2:Number, t:Number):Number {
			return (size2 * v1 * (1.0 - t) + size1 * v2 * t) / (size2 + (size1 - size2) * t);
		} 
	}	
}