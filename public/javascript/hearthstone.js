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
      fillTemplate(data.item);
    })
  })
}

var fillTemplate = function(data) {
  var template = $('#displayCard').html();
  var template = Handlebars.compile(template);
  var context = {'card': data};
  var compiledHTML = template(context);
  $('#cardResult').html(compiledHTML);
}