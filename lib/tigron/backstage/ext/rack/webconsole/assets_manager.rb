# encoding: utf-8

module Rack
  class Webconsole
    class AssetsManager
      include Rack::Webconsole::AssetHelpers

      def style_code
        css_code + "<style type=\"text/css\">#rack-webconsole { height: inherit !important; top: 40px; display: block !important; }</style>"
      end

      def javascript_code(env)
        render(js_code,
          TOKEN: Rack::Webconsole::Repl.token,
          KEY_CODE: Rack::Webconsole.key_code,
          CONTEXT: env["SCRIPT_NAME"] || "")
      end
    end
  end
end

