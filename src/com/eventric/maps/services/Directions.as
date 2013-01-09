package com.eventric.maps.services
{
	import com.eventric.maps.LatLngBounds;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.setTimeout;

	public class Directions
	{
		public var distanceHtml:String;
		public var durationHtml:String;
		public var bounds:LatLngBounds;
		public var numRoutes:int;
		public var distance:int;
		public var duration:int;

		private var clickHandler:Function;
		private var failureHandler:Function;
		private var successHandler:Function;

		public function Directions()
		{
		}

		public function load( urlString:String ):void
		{

		}

		public function loadFromWaypoints( waypoints:Array ):void
		{
			if (waypoints.length < 2)
				throw new Error("Directions must have at least a start and an end.");

			var loader:URLLoader = new URLLoader();
			var origin:Object = waypoints[0];
			var destination:Object = waypoints[waypoints.length-1];
			var betweenPoints:String = "";

			for each (var pnt:Object in waypoints)
				betweenPoints += pnt + "|";

			// remove the last pipe:
			betweenPoints = betweenPoints.substr(0,betweenPoints.length-2);

			var request:URLRequest = new URLRequest("http://maps.googleapis.com/maps/api/directions/json?origin=" + origin + "&destination=" + destination + "&waypoints=" + betweenPoints + "&sensor=false");

			request.method = URLRequestMethod.GET;
			loader.addEventListener(Event.COMPLETE,onDirectionsSuccess);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onDirectionsFailure);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onDirectionsFailure);
			loader.load(request);
		}

		/**
		 * Fired on successful (ie, not a 404 error) hitting of google's servers to geocode
		 * @param Event The returned event
		 */
		private function onDirectionsSuccess(event:Event):void
		{
			var directionsEvent:DirectionsEvent = new DirectionsEvent(event.currentTarget.data);

			if (directionsEvent.directions)
			{
				this.distance = directionsEvent.directions.distance;
				this.distanceHtml = directionsEvent.directions.distanceHtml;
				this.duration = directionsEvent.directions.duration;
				this.durationHtml = directionsEvent.directions.durationHtml;
			}

			setTimeout(successHandler,1,directionsEvent);
		}

		/**
		 * Handles either a 404-style error when trying to talk to google map APIs, or when the APIs have
		 * been reached, but no placemarks have been geocoded
		 * @param Event The returned event
		 */
		private function onDirectionsFailure(event:Event):void
		{
			var directionsEvent:DirectionsEvent = new DirectionsEvent("");
			setTimeout(failureHandler,1,directionsEvent);
		}

		public function createPolyline():Object
		{
			return null;
		}

		public function getRoute( num:int ):Route
		{
			return null;
		}

		/**
		 * Custom listener for directions events, adjust as needed (as they all just point back to the handler currently)
		 * @param String The type of event
		 * @param Function The handler
		 * @param Boolean Whether or not this event bubbles to the main window
		 * @param int The priority of this event
		 * @param Boolean Unknown, look up in adobe docs
		 */
		public function addEventListener(type:String, handler:Function, bubbles:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			switch(type)
			{
				case DirectionsEvent.DIRECTIONS_SUCCESS:
					successHandler = handler;
					break;
				case DirectionsEvent.DIRECTIONS_FAILURE:
					failureHandler = handler;
					break;
				default:
					throw new Error("Directions event listener must be of type DirectionsEvent");
			}
		}
	}
}