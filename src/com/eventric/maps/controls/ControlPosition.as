package com.eventric.maps.controls
{
	public class ControlPosition
	{
		public static const BOTTOM:int = 11;
		public static const BOTTOM_CENTER:int = 11;
		public static const BOTTOM_LEFT:int = 10;
		public static const BOTTOM_RIGHT:int = 12;
		public static const CENTER:int = 13;
		public static const LEFT:int = 5;
		public static const LEFT_BOTTOM:int = 6;
		public static const LEFT_CENTER:int = 4;
		public static const LEFT_TOP:int = 5;
		public static const RIGHT:int = 7;
		public static const RIGHT_BOTTOM:int = 9;
		public static const RIGHT_CENTER:int = 8;
		public static const RIGHT_TOP:int = 7;
		public static const TOP:int = 2;
		public static const TOP_CENTER:int = 2;
		public static const TOP_LEFT:int = 1;
		public static const TOP_RIGHT:int = 3;

		public var data:Object;

		/**
		 * Constructor
		 * @param int The position of the controls
		 */
		public function ControlPosition( position:int, arg2=null, arg3=null )
		{
			if (position < 1 || position > 12)
				this.data = ControlPosition.TOP_LEFT;
			else
				this.data = position;
		}
	}
}