# encoding: UTF-8
require "rest-client"
module UnRubySdk
  class UmengNotification
    def http_post(url, payload={}, headers={}, endpoint="api_send")
      post_api_url = send "#{endpoint}_url"
      load_json(resource(post_api_url).post(payload.to_json, params: headers))
    end

    def resource(url)
      RestClient::Resource.new(url, rest_client_options)
    end

    # return hash
    def load_json(string)
      result_hash = JSON.parse(string)
    end

    protected
    def host
      "http://msg.umeng.com"
    end

    def upload_url
      host + "/upload"
    end

    def api_send_url
      host + "/api/send"
    end
    # 测试master_secret
    def master_secret
      ''
    end
  end
end
