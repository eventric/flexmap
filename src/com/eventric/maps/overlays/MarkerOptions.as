package com.eventric.maps.overlays
{
	import com.eventric.maps.styles.FillStyle;

	public class MarkerOptions
	{
		// todo: fix this to be proper getter/setter:
		private var _clickable:Boolean;
		private var _customContent:Object = "<div></div>";
		private var _fillStyle:Object;
		private var _tooltip:String;
		private var _label:String;

		private var _draggable:Boolean;
		private var _gravity:Object;
		private var _hasShadow:Boolean;
		private var _icon:Object;
		private var _iconAlignment:Object;
		private var _iconOffset:Object;
		private var _labelFormat:Object;
		private var _radius:Object;
		private var _strokeStyle:Object;
			
		/**
		 * Getter for _clickable
		 * @return Boolean
		 */
		public function get clickable():Boolean
		{
			return this._clickable;
		}

		/**
		 * Setter for _clickable
		 * @param Boolean
		 */
		public function set clickable(val:Boolean):void
		{
			this._clickable = val;
		}

		/**
		 * Getter for _customContent
		 * @return Object
		 */
		public function get customContent():Object
		{
			return this._customContent;
		}
		
		/**
		 * Setter for _customContent
		 * @param Object
		 */
		public function set customContent(val:Object):void
		{
			this._customContent = val;
		}
		
		/**
		 * Getter for _fillStyle
		 * @return Object
		 */
		public function get fillStyle():Object
		{
			return this._fillStyle;
		}

		/**
		 * Setter for _fillStyle
		 * @param Object
		 */
		public function set fillStyle(val:Object):void
		{
			this._fillStyle = val;
		}

		/**
		 * Getter for _tooltip
		 * @return String
		 */
		public function get tooltip():String
		{
			return this._tooltip;
		}

		/**
		 * Setter for _tooltip
		 * @param String
		 */
		public function set tooltip(val:String):void
		{
			this._tooltip = val;
		}

		/**
		 * Getter for _label
		 * @return String
		 */
		public function get label():String
		{
			return this._label;
		}

		/**
		 * Setter for _label
		 * @param String
		 */
		public function set label(val:String):void
		{
			this._label = val;
		}

		/**
		 * Getter for _draggable
		 * @return Boolean
		 */
		public function get draggable():Boolean
		{
			return this._draggable;
		}

		/**
		 * Setter for _draggable
		 * @param Boolean
		 */
		public function set draggable(val:Boolean):void
		{
			this._draggable = val;
		}

		/**
		 * Getter for _gravity
		 * @return Object
		 */
		public function get gravity():Object
		{
			return this._gravity;
		}

		/**
		 * Setter for _gravity
		 * @param Object
		 */
		public function set gravity(val:Object):void
		{
			this._gravity = val;
		}

		/**
		 * Getter for _hasShadow
		 * @return Boolean
		 */
		public function get hasShadow():Boolean
		{
			return this._hasShadow;
		}

		/**
		 * Setter for _hasShadow
		 * @param Boolean
		 */
		public function set hasShadow(val:Boolean):void
		{
			this._hasShadow = val;
		}

		/**
		 * Getter for _icon
		 * @return Object
		 */
		public function get icon():Object
		{
			return this._icon;
		}

		/**
		 * Setter for _icon
		 * @param Object
		 */
		public function set icon(val:Object):void
		{
			this._icon = val;
		}

		/**
		 * Getter for _iconAlignment
		 * @return Object
		 */
		public function get iconAlignment():Object
		{
			return this._iconAlignment;
		}

		/**
		 * Setter for _iconAlignment
		 * @param Object
		 */
		public function set iconAlignment(val:Object):void
		{
			this._iconAlignment = val;
		}

		/**
		 * Getter for _iconOffset
		 * @return Object
		 */
		public function get iconOffset():Object
		{
			return this._iconOffset;
		}

		/**
		 * Setter for _iconOffset
		 * @param Object
		 */
		public function set iconOffset(val:Object):void
		{
			this._iconOffset = val;
		}

		/**
		 * Getter for _labelFormat
		 * @return Object
		 */
		public function get labelFormat():Object
		{
			return this._labelFormat;
		}

		/**
		 * Setter for _labelFormat
		 * @param Object
		 */
		public function set labelFormat(val:Object):void
		{
			this._labelFormat = val;
		}

		/**
		 * Getter for _radius
		 * @return Object
		 */
		public function get radius():Object
		{
			return this._radius;
		}

		/**
		 * Setter for _radius
		 * @param Object
		 */
		public function set radius(val:Object):void
		{
			this._radius = val;
		}

		/**
		 * Getter for _strokeStyle
		 * @return Object
		 */
		public function get strokeStyle():Object
		{
			return this._strokeStyle;
		}

		/**
		 * Setter for _strokeStyle
		 * @param Boolean
		 */
		public function set strokeStyle(val:Object):void
		{
			this._strokeStyle = val;
		}

		/**
		 * Constructor
		 * @param Object The options to instantiate the markers with
		 */
		public function MarkerOptions( opts:Object=null )
		{
			if (opts)
			{
				try {
					this.clickable = opts.hasOwnProperty("clickable") ? opts.clickable : false;
					this.fillStyle = opts.hasOwnProperty("fillStyle") ? new FillStyle(opts.fillStyle) : new FillStyle(new Object());
					this.tooltip = opts.hasOwnProperty("tooltip") ? opts.tooltip : "";
					this.label = opts.hasOwnProperty("label") ? opts.label : "";
				} catch(error:Error) {
					throw new Error("Marker Options not initialized correctly");
				}
			}
		}
	}
}