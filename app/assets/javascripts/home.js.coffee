jQuery ($) ->
  
  Messenger.options = 
    extraClasses: 'messenger-fixed messenger-on-top messenger-on-right'
    theme: 'flat'
    
  $('.instagram a').fluidbox()
  $('.automatic a').fluidbox()
  # $('.football a').fluidbox() 
  
  pusher    = new Pusher('ec30baff267be45877e8')
  instagram = pusher.subscribe('instagram')
  github    = pusher.subscribe('github')
  automatic = pusher.subscribe('automatic')
  football  = pusher.subscribe('football')

  instagram.bind 'created', (data) ->
    Messenger().post "<a style='color:#fff' href='#instagram-section'><i class='fa fa-instagram'></i> instagram loading...</a>"
    $('.instagram').last().fadeOut 250, ->
      @.remove()
      clone = $('.instagram').first().clone() 
      clone.find('img').attr('src', data.image_url)
      clone.find('a').attr('href', data.image_url)
      clone.hide().prependTo('#instagrams').fadeIn 1000
  
  github.bind 'created', (data) ->
    Messenger().post "<a style='color:#fff' href='#github-section'><i class='fa fa-github'></i> commit loading...</a>"
    date = new Date(data.commit_time)
    day = date.getDate()
    chart = $('#github-chart').highcharts()
    previous = chart.series[0].data[ day ].y
    chart.series[0].data[ day ].update( previous + 1 );
    
  automatic.bind 'created', (data) ->
    Messenger().post "<a style='color:#fff' href='#automatic-section'><i class='fa fa-car'></i> trip loading...</a>"
    $('.automatic').last().fadeOut 250, ->
      @.remove()
      clone = $('.automatic').first().clone()
      clone.find('img').attr('src', data.trip_map_url)
      clone.find('a').attr('href', data.trip_map_url)
      clone.hide().prependTo('#automatics').fadeIn 1000
      mpg = $('#mpg')
      gallons = $('#gallons')
      miles = $('#miles')
      mpg.fadeOut ->
        mpg.text( data.mpg )
        mpg.fadeIn()
      gallons.fadeOut ->
        gallons.text( data.gallons )
        gallons.fadeIn()
      miles.fadeOut ->
        miles.text( data.miles )
        miles.fadeIn()
      
  football.bind 'created', (data) ->
    Messenger().post "<a style='color:#fff' href='#football-section'><i class='fa fa-trophy'></i> football update loading...</a>"
    $('.football').last().fadeOut 250, ->
      @.remove()
      clone = $('.football').first().clone()
      clone.find('a').attr('href', data.player_url)
      clone.find('.player-name').text( data.player )
      clone.find('.player-status').text( data.status )
      clone.find('.time-ago').text("just now")
      clone.hide().prependTo('#footballs').fadeIn 1000
