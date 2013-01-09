package com.eventric.maps.services
{
	import com.eventric.maps.LatLng;

	public class Placemark
	{
		public var point:LatLng;

		public function Placemark( pnt:LatLng=null )
		{
			if (pnt)
				point = pnt;
		}
	}
}