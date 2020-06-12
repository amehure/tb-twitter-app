module EventsHelper
    def week(int)
        %w(日 月 火 水 木 金 土)[int.wday]
    end
end
