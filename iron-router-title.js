"use strict";
/*global Router:false */
/*global _:false */
Router.onAfterAction(function(){
  if(_.has(this.route.options, "title")){
    if(!_.isUndefined(this.route.options.title)){
      if(_.isString(this.route.options.title)){
        document.title = this.route.options.title;
      }else if(_.isFunction(this.route.options.title)){
        document.title = this.route.options.title.apply(this);
      }
    }
  }else if(_.has(Router.options, "title")){
    if(!_.isUndefined(Router.options.title)){
      if(_.isString(Router.options.title)){
        document.title = Router.options.title;
      }else if(_.isFunction(Router.options.title)){
        document.title = Router.options.title.apply(this);
      }
    }
  }
});