Router.onAfterAction(function(){
  if(_.has(this.route.options, 'title')){
      if(!_.isUndefined(this.route.options.title)){
        if(_.isString(this.route.options.title)){
          document.title = this.route.options.title;
        }else if(_.isFunction(this.route.options.title)){
          document.title = this.route.options.title.apply(this);
        }
      }
  }
});