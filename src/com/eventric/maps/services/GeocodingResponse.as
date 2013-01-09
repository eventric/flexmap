package com.eventric.maps.services
{
	import com.eventric.maps.LatLng;

	public class GeocodingResponse
	{
		public var name:String;
		public var placemarks:Array;

		/**
		 * Wrapper for the response sent from google map APIs
		 * @param String The formatted string of JSON data returned from the APIs (handled from GeocodingEvent)
		 */
		public function GeocodingResponse( response:String )
		{
			try {
				this.placemarks = new Array();

				var formattedResponse:Object = JSON.parse(response);
				var placemark:Placemark = new Placemark(new LatLng(formattedResponse.results[0].geometry.location.lat,formattedResponse.results[0].geometry.location.lng));
				this.placemarks.push(placemark);
			}
			catch(error:Error) {
				onResponseError(error);
			}
		}

		/**
		 * Sanity check, this should never be hit, but in case it is, this would handle an unexpected change in
		 * google's geocoded placemarks
		 * @param Error The error received
		 */
		private function onResponseError(error:Error):void
		{

		}
	}
}