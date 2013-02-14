require 'resque'

module DelayedPaperclip
  module Jobs
    class Resque
      @queue = :paperclip

      def self.perform(instance_klass, instance_id, attachment_name)
        DelayedPaperclip.process_job(instance_klass, instance_id, attachment_name)
      end

      def self.enqueue_delayed_paperclip(instance_klass, account_id, instance_id, attachment_name)
        ::Resque.enqueue(self, instance_klass, account_id, instance_id, attachment_name)
      end

    end
  end
end
