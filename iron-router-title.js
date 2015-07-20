"use strict";
/*global Router:false */
/*global _:false */
Router.onAfterAction(function(){
  var currentRoute = this;

  var setDefaultTitle = function(){
    var title = Router.options.title;
    if(!_.isUndefined(title)){
      if(_.isString(title)){
        document.title = title;
      }else if(_.isFunction(title)){
        document.title = title.apply(currentRoute);
      }
    }
  }

  var setRouteTitle = function(){
    var title = currentRoute.route.options.title;
    if(!_.isUndefined(title)){
      if(_.isString(title)){
        document.title = title;
      }else if(_.isFunction(title)){
        if(!_.isUndefined(title.apply(currentRoute))){
          document.title = title.apply(currentRoute);
        }else{
          setDefaultTitle()
        }
      }
    }
  }

  if(_.has(this.route.options, "title")){
    setRouteTitle()
  }else if(_.has(Router.options, "title")){
    setDefaultTitle()
  }
});
