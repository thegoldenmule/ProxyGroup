package com.thegoldenmule.utils 
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	dynamic public class ProxyGroup extends Proxy
	{
		private var _objects:Array = [];
		
		public function ProxyGroup() {
			
		}
		
		public function add(object:Object):ProxyGroup {
			if (_objects.indexOf(object) == -1) {
				_objects.push(object);
			}
			
			return this;
		}
		
		public function remove(object:Object):ProxyGroup {
			_objects = _objects.splice(_objects.indexOf(object), 1);
			
			return this;
		}
		
		override flash_proxy function callProperty(methodName:*, ... args):* {
			var res:*;
			
			// custom stuff for later?
			
			return res;
		}
		
		override flash_proxy function getProperty(name:*):* {
			return _objects.length > 0 ? _objects[0][name] : null;
		}
		
		override flash_proxy function setProperty(name:*, value:*):void {
			for each (var object:Object in _objects) {
				try {
					object[name] = value;
				} catch (error:Error) {}
			}
		}
	}
}