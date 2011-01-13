module Fancygrid
  module Generators#:nodoc:
    class ScssGenerator < Rails::Generators::Base#:nodoc:
      def copy_scss
        plugin_path = File.join(File.dirname(__FILE__), "../../public/stylesheets/_fancygrid.scss")
        rails_path = Rails.root.join("app/stylesheets/_fancygrid.scss")
        copy_file(plugin_path, rails_path)
      end
    end
  end
end