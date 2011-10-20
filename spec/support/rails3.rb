module Rails3
  module Execute
    def rails3(&block)
      if ActiveRecord::VERSION::MAJOR > 2
        block.call
      end
    end
  end
end
