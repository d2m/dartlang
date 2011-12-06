class h5utils {

  h5utils() {}
  
  void viewsource() {
    
    var pre = new Element.tag('pre');
    pre.id = "view-source";

    window.on.click.add((var e) {
      if (e.target.hash && e.target.hash === '#view-source') {        
        if (document.query('#view-source') === null) {
          XMLHttpRequest request = new XMLHttpRequest();
          request.on.load.add((event) {
            String result = request.responseText;
            result = result.replaceAll('<', '&lt;');
            result = result.replaceAll('>', '&gt;');
            pre.innerHTML = result;
            });
          request.open("GET", window.location.href, true);
          request.send();
        };

        document.query('body').nodes.add(pre);
        document.query('body').attributes['class'] = 'view-source';

        var sourceTimer;
        
        void clearviewsource() {
          if (window.location.hash != '#view-source') {
            window.clearInterval(sourceTimer);
            document.query('body').attributes['class'] = '';
          };
        };
        
        sourceTimer = window.setInterval(clearviewsource, 200);

      };
    });

  }
  
}
