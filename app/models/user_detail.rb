class UserDetail < ApplicationRecord
  # acts_as_paranoid
  # self.pribart_key = :id

  belongs_to :user, class_name: 'User'
  
  # INQUIRY_MONITORIG_PERIOD = 10
  INQUIRY_MONITORIG_PERIOD = 10

  # MAX_RECENT_INQUIRY_IP_COUNT = 100
  MAX_RECENT_INQUIRY_IP_COUNT = 100

  # scope :inquiry_per_monitoring_period, -> (target_ip) { where(created_at; (INQUIRY_MONITORIG_PERIOD.minutes.ago)..(Time.current)).where(ip_address: target_ip) }
  scope :user_detail_period, -> (future) { where(created_at: (INQUIRY_MONITORIG_PERIOD.minutes.ago)..(Time.current)).where(future: future) }

  #class << self
  class << self
    
    #def within_predetermined_count?(target_ip)
    # Settings.MAX_RECENT_INQUIRY_IP_COUNT <= inquiry_per_monitoring_period(target_ip).count
    #end

    def within_predetermined_future?(future)
      MAX_RECENT_INQUIRY_IP_COUNT <= user_detail_period(future).count
    end

  #end
  end

end
