function requestPush() {
  var es = new EventSource('/sse');

  es.onerror = function(err) {
    alert(err);
    es.close();
  };

  es.onmessage = function(event) {
    if (event.data === 'yes') {
      document.querySelector('#loading').remove();
      es.close();
    }
  };
}
