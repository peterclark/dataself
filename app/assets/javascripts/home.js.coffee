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
  
  barChartData = [
    {
      label: "Series 1",
      values: [ 
        {time: 1370044800, y: 100}, 
        {time: 1370044801, y: 1000}
      ]
    },
    {
      label: "Series 2",
      values: [ 
        {time: 1370044800, y: 78}, 
        {time: 1370044801, y: 98}
      ]
    }
  ]

  $('#github-heatmap').epoch
    type: 'time.bar'
    data: barChartData
    axes: ['left', 'right', 'bottom']
  
  