package com.eventric.maps.overlays
{
	import com.eventric.maps.LatLngBounds;

	public class Polyline
	{
		public var data:Array;
		public var options:PolylineOptions;

		/**
		 * Constructor
		 * @param Array The array of LatLngs that make up this Polyline
		 */
		public function Polyline( coords:Array )
		{
			this.data = coords;
			this.options = new PolylineOptions(this.data);
		}

		/**
		 * Sets pu LatLngBounds that (ultimately) return null, as we do all bounds calculations remotely
		 * @return LatLngBounds
		 */
		public function getLatLngBounds():LatLngBounds
		{
			if (!data || data.length == 0)
				return null;

			var bounds:LatLngBounds = new LatLngBounds(this.data);
			return bounds;
		}
	}
}