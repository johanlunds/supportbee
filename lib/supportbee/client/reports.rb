module Supportbee
  class Client
    module Reports
      
      [
        :archives_count,
        :avg_archive_time,
        :avg_first_response_time,
        :replies_count,
        :tickets_count,
      ].each do |metric|
        define_method(metric) do |extra_parameters = {}|
          response = @conn.get do |req|
            req.url "/reports/#{metric}.json"
            req.params.merge!(extra_parameters)
          end

          JSON.parse(response.body)
        end
      end

    end
  end
end
