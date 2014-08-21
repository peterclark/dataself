jQuery ($) ->
   
  pusher = new Pusher('ec30baff267be45877e8')
  instagrams = pusher.subscribe('instagrams')

  instagrams.bind 'created', (data)->
    instagrams = $('.instagram-column')
    if instagrams.length == 6
      instagrams.first().fadeOut(250, -> @.remove())
    column = instagrams.last().clone()
    column.find('.instagram').attr('src', data.image_url)
    column.hide().appendTo("#instagrams").fadeIn(1000)
  
  $('#github-chart').highcharts({
    chart: { type: 'bar' },
    title: { text: 'Fruit Consumption' },
    xAxis: { categories: ['Apples', 'Bananas', 'Oranges'] },
    yAxis: { title: { text: 'Fruit eaten' } },
    series: [{
      name: 'Jane',
      data: [1, 0, 4]
    }, {
      name: 'John',
      data: [5, 7, 3]
    }]
  });