class Upload < ActiveRecord::Base
  
  has_attached_file :attachment,
    :styles =>{
      :thumb  => "100x75#",
      :medium => "200x150#",
      :large => "400x300#",
      :huge => "800x600#"
    },
    :convert_options => { 
      :thumb => "-quality 95", 
      :medium => "-quality 95", 
      :large => "-quality 95", 
      :huge => "-quality 95"
    },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => ":attachment/fractals/:id/:style.:extension",
    :bucket => 'fractal'
    
end
