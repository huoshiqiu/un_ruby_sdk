# encoding: UTF-8
module UnRubySdk
  class UnAndroid < UmengNotification
    def payload options
      options.slice(:display_type, :body).tap do |p|
        body = p[:body]
        if !body.has_key?(:ticker) || !body.has_key?(:title) || !body.has_key?(:text) || !body.has_key?(:after_open)
          raise RuntimeError, '缺少payload必填参数'
        end
        p[:body].slice!(:ticker, :title, :text, :after_open# 此4个必填
          :icon, :largeIcon, :play_vibrate, :play_lights,
          :play_sound, :url, :activity, :custom
        )
      end
    end
  end
end
