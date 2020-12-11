source "https://github.com/dwirandyh/dicoding-ios-module-spec"
source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'restaurant-app' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  workspace "RestaurantApp"

  # Pods for restaurant-app
  pod "Resolver"
  pod "Alamofire"
  pod "RealmSwift"
  pod "About"

  target 'restaurant-appTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'restaurant-appUITests' do
    # Pods for testing
  end

  target 'Detail' do
    project './Module/Detail/Detail'
    
    target 'DetailTests' do
    end
  end

  target 'Favorite' do
    project './Module/Favorite/Favorite'

    target 'FavoriteTests' do
    end
  end

  target 'Home' do
    project './Module/Home/Home'

    target 'HomeTests' do
    end
  end

  target 'Common' do
    project './Module/Common/Common'

    target 'CommonTests' do 
    end
  end 

  target 'Routing' do
    project './Module/Routing/Routing'
    target 'RoutingTests' 
  end

end
