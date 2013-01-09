package com.eventric.maps.overlays
{
	import com.eventric.maps.InfoWindowOptions;
	import com.eventric.maps.LatLng;
	import com.eventric.maps.MapMouseEvent;

	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;

	import mx.controls.Button;
	import mx.core.ClassFactory;
	import mx.core.Container;
	import mx.core.IFactory;

	public class Marker
	{
		private var _latLong:LatLng;
		private var _options:MarkerOptions;

		public var clickHandler:Function;
		public var doubleClickHandler:Function;
		public var mouseDownHandler:Function;
		public var mouseUpHandler:Function;
		public var mouseOverHandler:Function;
		public var mouseOutHandler:Function;

		public var data:Object;
		public var title:String;
		public var iconUrl:String = "";

		public var infoWindow:InfoWindowOptions;

		// true if you want to show the info window of your choice on click, false if not:
		private static var SHOW_INFO_WINDOW:Boolean = true;

		/**
		 * Constructor
		 *
		 * @param	LatLng	The lat/long of this marker's point
		 * @param	MarkerOptions	The marker options for this marker
		 * @param	Object	The customIcon for this marker
		 */
		public function Marker(latLng:LatLng, opts:MarkerOptions=null)
		{
			this._latLong = latLng;
			this._options = opts;
		}

		/**
		 * Setter for options in the old form setOptions (signed this way for v2 compatibility)
		 *
		 * @param	MarkerOptions	The marker options for this marker
		 */
		public function setOptions(opts:MarkerOptions):void
		{
			this._options = opts;

			// also instantiate the infoWindow here:
			if (SHOW_INFO_WINDOW)
			{
				this.infoWindow = new InfoWindowOptions();
				this.infoWindow.customContent = this._options.customContent;
				this.infoWindow.drawDefaultFrame = true;
				this.infoWindow.customOffset = new Point(1,1);
			}
		}

		/**
		 * Getter for options in the old form getOptions (signed this way for v2 compatibility)
		 *
		 * @return	MarkerOptions	The marker options for this marker
		 */
		public function getOptions():MarkerOptions
		{
			return this._options;
		}


		/**
		 * Here for backwards compatibility: the info windows are now attached to the remote markers
		 * on creation
		 * @deprecated
		 */
		public function openInfoWindow( iWindowOpts:InfoWindowOptions ):void
		{

		}

		/**
		 * Sets this local position
		 * @param LatLng The locally defined position
		 */
		public function setPosition(val:LatLng):void
		{
			this._latLong = val;
		}

		/**
		 * Getter for the local position
		 * @return LatLng The position of this local marker
		 */
		public function getPosition():LatLng
		{
			return this._latLong;
		}

		/**
		 * Deprecated; as each remote marker is created, they're assigned to the remote map
		 * @param Object The map that would be assigned to this marker
		 * @deprecated
		 */
		public function setMap(map:Object):void
		{

		}

		/**
		 * Drop in point for handling a map click (called from google receiving a click)
		 * @param Object The object clicked on the map (currently all listeners are attached to markers)
		 */
		public function interceptClick( event:Object ):void
		{
			var mapMouseEvent:MapMouseEvent = new MapMouseEvent(this);
			setTimeout(this.clickHandler,1,mapMouseEvent);
		}

		/**
		 * Custom listener for map clicks, adjust as needed (as they all just point back to the handler currently)
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
				case MapMouseEvent.CLICK:
					clickHandler = handler;
					break;
				case MapMouseEvent.DOUBLECLICK:
					doubleClickHandler = handler;
					break;
				case MapMouseEvent.MOUSEDOWN:
					mouseDownHandler = handler;
					break;
				case MapMouseEvent.MOUSEOUT:
					mouseOutHandler = handler;
					break;
				case MapMouseEvent.MOUSEOVER:
					mouseOverHandler = handler;
					break;
				case MapMouseEvent.MOUSEUP:
					mouseUpHandler = handler;
					break;
				default:
					throw new Error("Marker event listener must be of type MapMouseEvent");
			}
		}
	}
}