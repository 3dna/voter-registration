module VoterRegistration
  module RegisterHelper

    def help_text(instructions, field_name)
      unless instructions.nil?
        info = instructions.detect { |f| f[:name] == field_name }
        if info
          info.help_text
        end
      end
    end

    def title_select
      ["Mr.","Mrs.","Miss","Ms."]
    end

    def suffix_select
      ["Jr","Sr","II","III","IV"]
    end

  end
end