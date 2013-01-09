package com.eventric.maps
{
	public class MapMouseEvent
	{
		public static const CLICK:String = "click";
		public static const DOUBLECLICK:String = "dblclick";
		public static const MOUSEUP:String = "mouseup";
		public static const MOUSEDOWN:String = "mousedown";
		public static const MOUSEOVER:String = "mouseover";
		public static const MOUSEOUT:String = "mouseout";

		public var target:Object;

		public function MapMouseEvent( event:Object )
		{
			this.target = event;
		}
	}
}