# encoding: UTF-8
require "rest-client"
module UnRubySdk
  class UmengNotification
    def initialize(appkey, app_master_secret, options={})
      @appkey = appkey
      @app_master_secret = app_master_secret
      @options = options
    end

    def http_post headers={}, endpoint="api_send"
      post_api_url = send "#{endpoint}_url"
      payload = payload.to_json
      load_json(resource(post_api_url + "?sign=#{sign(post_api_url, payload)}").post(payload, params: headers))
    end

    def default_payload
      { appkey: 'appkey', timestamp: Time.now.to_i }
    end

    def command_keys
      @options.slice(:appkey, :timestamp, :type, :device_tokens,
        :alias, :alias_type, :file_id, :filter, :production_mode,
			  :feedback, :description, :thirdparty_id)
    end

    def policy params
      params.slice(:start_time, :expire_time, :max_send_num)
    end

    def payload params
      raise NotImplementedError, "Subclasses must implement a payload method"
    end

    def sign url, post_body
      Digest::MD5.hexdigest ["POST", url, post_body, master_secret].join
    end

    def resource url
      RestClient::Resource.new(url, rest_client_options)
    end

    # return hash
    def load_json string
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
      'example_secret'
    end
  end
end
