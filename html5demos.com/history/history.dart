#import('dart:html');
#import('dart:json');
#source('../h5utils.dart');

class html5historyapi {
  
  var state, lastevent, urlhistory, examples, output;
  var defaultData;
  Map<String, Dynamic> data;
  
  String template(var data) => "<p>URL: <strong>${data['url']}</strong>, name: " +
            "<strong>${data['name']}</strong>, location: " +
            "<strong>${data['location']}</strong></p>";
  
  html5historyapi() {}  

  void run() {
    defaultData = {'url': "unknown", 'name': "undefined", 'location': "undefined" };
    data = {
             'first' : {
               'name': "Remy",
               'location': "Brighton, UK"
             },
             'second': {
               'name': "John",
               'location': "San Francisco, USA"
             },
             'third': {
               'name': "Jeff",
               'location': "Vancover, Canada"
             },
             'fourth': {
               'name': "Simon",
               'location': "London, UK"
             }
           };
    state = document.query('#status');
    lastevent = document.query('#lastevent');
    urlhistory = document.query('#urlhistory');
    examples = document.queryAll('#examples a');
    
    for (var link in examples) {
      link.on.click.add((var e) {
        e.preventDefault();
        
        var title, url;
        title = e.target.innerHTML;
        url = e.target.attributes['href'];
        data[title]['url'] = url;
        var map = JSON.stringify(data[title]);
        window.history.pushState(map, title, e.target.href);
        reportEvent(e);
        reportData(data[title]);        
        });
    };
        
    output = document.query('#output');
    try {
        if (window.history.pushState != null) {
          state.attributes['class'] = 'success';
          state.innerHTML = 'HTML5 History API available';      
        }
    } catch (var e) {
      final msg = e.toString();
      print('Suppressed exception ${msg}');
      state.attributes['class'] = 'fail';
    };
    
    window.on.popState.add((var e) {
      var data = e.state;
      reportEvent(e);
      if (data === null) {
        reportData(defaultData);
      }
      else {
        reportData(JSON.parse(data));
      };
    });
    
    window.on.hashChange.add((var e) {
      reportEvent(e);
    });
    
    window.on.pageShow.add((var e) {
      reportEvent(e);
    });
    
    window.on.pageHide.add((var e) {
      reportEvent(e);
    });
    
    var h5 = new h5utils();
    h5.viewsource();
    
  }
  
  void reportEvent(var event) {
    lastevent.innerHTML = event.type;
  }
  
  void reportData(var data) {
    output.innerHTML = template(data);
  }

}

void main() {
  new html5historyapi().run();
}
