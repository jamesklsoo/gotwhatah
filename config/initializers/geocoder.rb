Geocoder.configure(

  # set default units to kilometers:
  :units => :km,

  :http_proxy => ENV['QUOTAGUARD_URL'],
  :timeout => 5

)
