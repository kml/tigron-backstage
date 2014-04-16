# encoding: utf-8

module Rack
  class Webconsole
    class TigronRepl
      def call(env)
        req = Rack::Request.new(env)
        params = req.params

        $sandbox ||= Rack::Webconsole::Sandbox.new
        hash = Rack::Webconsole::Shell.eval_query params["query"]
        response_body = MultiJson.encode(hash)

        headers = {}
        headers["Content-Type"] = "application/json"
        headers["Content-Length"] = response_body.bytesize.to_s

        [200, headers, [response_body]]
      end
    end
  end
end

