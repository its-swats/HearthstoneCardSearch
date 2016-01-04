$(function(){
  prepEnvironment();
  searchHandler();
})

var prepEnvironment = function(){
  server = 'localhost:3000'
}

var searchHandler = function(){
  $('#searchForm').on('submit', function(event){
    event.preventDefault()
    var search_data = $(this).serialize()
    var response = $.ajax({
      type: 'GET',
      url: 'http://' + server + '/find_card',
      data: search_data
    })
    response.done(function(data){
      printToScreen(data);
    })
  })
}

var printToScreen = function(data) {
  if (!!data.cards.length === false) {
    displayTemplate('noResults')
  } else {
    displayTemplate('displayCard', data)
  }
}

var displayTemplate = function(type, data) {
  var template = $('#'+type).html();
  if (!!data === true) {
    var template = Handlebars.compile(template);
    var context = {'card': data.cards};
    var template = template(context);
  }
  $('#cardResult').html(template)
}