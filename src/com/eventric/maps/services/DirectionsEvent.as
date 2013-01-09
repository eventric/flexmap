package com.eventric.maps.services
{
	public class DirectionsEvent
	{
		public static const DIRECTIONS_SUCCESS:String = "directionssuccess";
		public static const DIRECTIONS_FAILURE:String = "directionsfailure";

		public var directions:Directions;

		public function DirectionsEvent( resp:String )
		{
			try {
				var respJSON:Object = JSON.parse(resp);

				var totalDistance:int = 0;

				for each (var leg:Object in respJSON.routes[0].legs)
				{
					if ((leg.distance.text as String).indexOf("mi") != -1)
					{
						var distanceArray:Array = (leg.distance.text as String).split(" ");
						totalDistance += new Number(distanceArray[0]);
					}
				}

				this.directions = new Directions();
				this.directions.distance = totalDistance;
				this.directions.distanceHtml = "<span>" + totalDistance + " miles</span>";
//				this.directions.duration = respJSON.duration.value;
//				this.directions.durationHtml = "<span>" + respJSON.duration.text + "</span>";
			} catch(error:Error) {
				this.onResponseError(error);
			}
		}

		/**
		 * This function will be hit in case of more than 25 waypoints (which google won't map)
		 * @param Error The error received
		 */
		private function onResponseError(error:Error):void
		{

		}
	}
}