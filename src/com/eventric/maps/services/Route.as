package com.eventric.maps.services
{
	public class Route
	{
		public var startGeocode:Placemark;
		public var endGeocode:Placemark;
		public var numSteps:int;

		public function Route()
		{
		}

		public function getStep( stepNum:int ):Route
		{
			return null;
		}
	}
}