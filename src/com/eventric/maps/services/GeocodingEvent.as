package com.eventric.maps.services
{
	public class GeocodingEvent
	{
		public static const GEOCODING_SUCCESS:String = "geocodingsuccess";
		public static const GEOCODING_FAILURE:String = "geocodingfailure";

		public var response:GeocodingResponse;

		/**
		 * Constructor
		 * @param String The remote data passed back from google map APIs
		 */
		public function GeocodingEvent(remoteData:String)
		{
			response = new GeocodingResponse(remoteData);
		}
	}
}