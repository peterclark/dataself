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
  
  # $('#github-chart').highcharts({
  #   chart: { type: 'column' },
  #   title: { text: 'Fruit Consumption' },
  #   xAxis: { categories: ['Apples', 'Bananas', 'Oranges'] },
  #   yAxis: { title: { text: 'Fruit eaten' } },
  #   series: [{
  #     name: 'Jane',
  #     data: [1, 0, 4]
  #   }]
  # });
  # 
  # $.ajax
  #   dataType: "json",
  #   url: "/api/1/githubs/commits_by_day"
  #   success: (data) ->
  #     chart = $('#github-chart').highcharts()
  #     chart.series[0].setData [5,1,8]