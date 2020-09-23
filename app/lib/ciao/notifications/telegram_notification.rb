# frozen_string_literal: true

module Ciao
  module Notifications
    class TelegramNotification < Base
      def notify(payload_data = {})
        Rails.logger.info payload_data.inspect
        text = <<~TEXT
          *\\[域名預警\\]* 域名状态改变了

          name: `#{payload_data.dig(:name)}`
          status\\_before: `#{payload_data.dig(:status_before)}`
          status\\_after: `#{payload_data.dig(:status_after)}`

          \\#域名预警 \\##{Rails.env}
        TEXT
        Rails.logger.info text
        Telegram.bot.send_message(
          chat_id: ENV['TELEGRAM_CHANNEL_ID'],
          text: text,
          parse_mode: 'MarkdownV2'
        )
      end
    end
  end
end
