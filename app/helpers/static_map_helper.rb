module StaticMapHelper

  def static_map_for(location, options = {})
    params = {
      :center => [location.lat, location.lng].join(","),
      :markers => [location.lat, location.lng].join(","),
      :sensor => true
    }.merge(options)

    query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    image_tag "https://maps.googleapis.com/maps/api/staticmap?center=#{@event.latitude},#{@event.longitude}&zoom=13&size=600x300&markers=color:blue%7Clabel:E%7C#{@event.latitude},#{@event.longitude}&markers=color:red%7Clabel:U%7C#{current_user.latitude},#{current_user.longitude}&maptype=roadmap&key=#{ENV['GOOGLE_API_KEY']}", :alt => location.name
  end

end
