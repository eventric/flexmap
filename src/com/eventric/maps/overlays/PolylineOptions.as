package com.eventric.maps.overlays
{
	public class PolylineOptions
	{
		public var clickable:Boolean;
		public var editable:Boolean;
		public var geodesic:Boolean;
		public var icons:Array;
		public var map:Object;
		public var path:Array;
		public var strokeColor:String;
		public var strokeOpacity:Number;
		public var strokeWeight:Number;
		public var visible:Boolean;
		public var zIndex:Number;

		/**
		 * Constructor
		 * @param Array The path of LatLngs for a Polyline
		 */
		public function PolylineOptions( latLongArray:Array )
		{
			this.path = latLongArray;
		}
	}
}