jQuery ($) ->
   
  pusher = new Pusher('ec30baff267be45877e8')
  
  instagram = pusher.subscribe('instagram')
  github = pusher.subscribe('github')

  instagram.bind 'created', (data)->
    instagrams = $('.instagram-column')
    if instagrams.length == 6
      instagrams.first().fadeOut(250, -> @.remove())
    column = instagrams.last().clone()
    column.find('.instagram').attr('src', data.image_url)
    column.hide().appendTo("#instagrams").fadeIn(1000)
  
  github.bind 'created', (data)->
    date = new Date(data.commit_time)
    day = date.getDate()
    chart = $('#github-chart').highcharts()
    previous = chart.series[0].data[ day ].y
    chart.series[0].data[ day ].update( previous + 1 );
