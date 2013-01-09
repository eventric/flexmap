package com.eventric.maps.styles
{
	public class FillStyle
	{
		public var color:String;
		public var alpha:String;
		public var gradient:String;

		public function FillStyle( opts:Object )
		{
			// convert int color to hex:
			if (opts.hasOwnProperty("color")) this.color = opts.color;
			if (opts.hasOwnProperty("alpha")) this.alpha = opts.alpha;
			if (opts.hasOwnProperty("gradient")) this.gradient = opts.gradient;
		}
	}
}