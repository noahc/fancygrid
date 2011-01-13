require 'ftools'

module Fancygrid
  
  module Helper    
    
    # Creates a fancygrid instance for the given model name, its class and
    # its table name.
    # === Example
    #    fancygrid_for :users do |grid|
    #      
    #      # specify attributes to display  
    #      grid.attributes( :id, :username, :email )
    #   
    #      # specify the callback url for ajax loading
    #      grid.url = users_path
    #      
    #      # finally call find with some customized find options
    #      grid.find( :order => "users.created_at DESC" )
    #      
    #    end
    def fancygrid_for(name, klass = nil, table_name = nil)#:yields: grid
      store_name = name.to_s
      @fancygrid ||= {}
      @fancygrid[store_name] ||= Grid.new(name, klass, table_name, params)
      yield @fancygrid[store_name] if block_given?

      @fancygrid[store_name]
    end
    
    # Renders an existing fancygrid for the given name. You can append a rendering block
    # or pass a template name as an option for custom rendering.
    # === Options
    # * <tt>data</tt> - The data to render
    # * <tt>template</tt> - The template to use for custom rendering columns
    # * <tt>url</tt> - The callback url for ajax
    # * <tt>search_enabled</tt> - If true, the search will be visible
    # * <tt>hide_top_control</tt> - If true, the top control bar will be hidden
    # * <tt>hide_bottom_control</tt> - If true, the bottom control bar will be hidden
    # * <tt>grid_type</tt> - may be one of <tt>:list</tt> table <tt>:table</tt> to render a list or a table
    def fancygrid(name, options=nil, &block)#:yields: column, record, value
      
      store_name = name.to_s
      raise "Missing fancygrid for name '#{store_name}'" if(@fancygrid.nil? || @fancygrid[store_name].nil?)
      fancygrid_instance = @fancygrid[store_name]
      
      options ||= {}
      [:data, :template, :url, :search_enabled, :hide_top_control, 
       :hide_bottom_control, :grid_type
      ].each do |option|
        fancygrid_instance.send(option + "=", options[option]) if options[option]
      end
      
      format_block = block_given? ? block : nil
      template = Fancygrid.table_template
      template = Fancygrid.list_template if(fancygrid_instance.grid_type.to_s == "list")
      
      render(:template => template, :locals => { 
        :fancygrid => fancygrid_instance, 
        :cells_block => format_block, :format_block => format_block
      })
    end
    
    # Renders the given <tt>record</tt>, <tt>leaf</tt> and <tt>value</tt> with the
    # leafs template or the passed rendering block. The result is a column cell content.
    def format_fancygrid_value(record, leaf, value=nil, &format_block)
      if block_given?
        capture(leaf, record, value, &format_block)
      else
        render( :template => leaf.root.template, :locals => { 
          :grid => leaf.root, :table => leaf.root,
          :record => record, 
          :cell => leaf, :column => leaf, 
          :value => value 
        })
      end
    end
    alias :fancy_rendering_for :format_fancygrid_value # backward compatibility
    
    # Returns the <tt>value</tt> of the given <tt>leaf</tt> if it is not <tt>:formatable</tt>.
    # Otherwie the <tt>leaf</tt> ist <tt>value</tt> and the <tt>record</tt> will
    # be passed to the <tt>format_fancygrid_value</tt> method to render and format
    # the value. The result is a column cell content.
    def render_fancygrid_leaf(record, leaf, &format_block)
      value = leaf.value_from(record)
      return value unless leaf.formatable
      format_fancygrid_value(record, leaf, value, &format_block)
    end
    alias :fancyvalue_for :render_fancygrid_leaf # backward compatibility

  end

end