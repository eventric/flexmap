package com.eventric.maps.controls
{
	public class MapTypeControl
	{
		public static const DEFAULT:int = 0;
		public static const DROPDOWN_MENU:int = 2;
		public static const HORIZONTAL_BAR:int = 1;

		public var data:Object;

		/**
		 * Constructor
		 * @param Object The parameters to set the map to
		 */
		public function MapTypeControl( params:Object=null )
		{
			this.data = params;
		}
	}
}