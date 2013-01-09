package com.eventric.maps.services
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.setTimeout;

	import org.iotashan.utils.URLEncoding;

	public class ClientGeocoder
	{
		private var failureHandler:Function;
		private var successHandler:Function;
		public var requestString:String;

		/**
		 * Constructor
		 */
		public function ClientGeocoder()
		{

		}

		/**
		 * Contacts google's API to geocode a location
		 * @param String The string of data to use when trying to locate a place (address, city, etc)
		 */
		public function geocode( latlongString:String ):void
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest("http://maps.googleapis.com/maps/api/geocode/json?address=" + URLEncoding.encode(latlongString) + "&sensor=false");

			request.method = URLRequestMethod.GET;
			loader.addEventListener(Event.COMPLETE,onGeocodeSuccess);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onGeocodeFailure);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onGeocodeFailure);
			loader.load(request);
		}

		/**
		 * Fired on successful (ie, not a 404 error) hitting of google's servers to geocode
		 * @param Event The returned event
		 */
		private function onGeocodeSuccess(event:Event):void
		{
			var geocodeEvent:GeocodingEvent = new GeocodingEvent(event.currentTarget.data);

			// this can gets called when there are no results as well (it's not a failure/404):
			if (geocodeEvent.response.placemarks.length == 0)
				onGeocodeFailure(event);
			else
				setTimeout(successHandler,1,geocodeEvent);
		}

		/**
		 * Handles either a 404-style error when trying to talk to google map APIs, or when the APIs have
		 * been reached, but no placemarks have been geocoded
		 * @param Event The returned event
		 */
		private function onGeocodeFailure(event:Event):void
		{
			var geocodeEvent:GeocodingEvent = new GeocodingEvent("");
			setTimeout(failureHandler,1,geocodeEvent);
		}

		/**
		 * Custom event listener. Specify extras as you will.
		 * @param String The type of event
		 * @param Function The handler
		 */
		public function addEventListener( type:String, handler:Function ):void
		{
			switch(type)
			{
				case GeocodingEvent.GEOCODING_SUCCESS:
					successHandler = handler;
					break;
				case GeocodingEvent.GEOCODING_FAILURE:
					failureHandler = handler;
					break;
				default:
					throw new Error("Unknown geocoding event attached, please use a GeocodingEvent.");
			}
		}
	}
}