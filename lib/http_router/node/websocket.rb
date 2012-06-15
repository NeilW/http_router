class HttpRouter
  class Node
    class Websocket < Node
      def usable?(other)
        other.class == self.class
      end

      def to_code
	"if request.rack_request.get? &&
          request.rack_request.env['HTTP_CONNECTION'] &&
          request.rack_request.env['HTTP_CONNECTION'].split(/\s*,\s*/).include?('Upgrade') &&
	  %w(WebSocket websocket).include?(request.rack_request.env['HTTP_UPGRADE'])
            #{super}
        end"
      end

      def inspect_label
        "#{self.class.name.split("::").last} (#{@matchers.size} matchers)"
      end
      
    end
  end
end
