package com.eventric.maps
{
	public class LatLng
	{
		public var latitude:Number;
		public var longitude:Number;
		
		public function LatLng( lat:Number, long:Number )
		{
			this.latitude = lat;
			this.longitude = long;
		}

		public function lat():Number
		{
			return this.latitude;
		}

		public function lng():Number
		{
			return this.longitude;
		}
	}
}