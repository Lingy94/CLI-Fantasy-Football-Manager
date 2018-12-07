class Team < ActiveRecord::Base
  belongs_to :user
  has_many :selections
  has_many :players, through: :selections



  def pick_goal_keeper
        puts "\nPick your goalkeeper by typing their number.\n".colorize(:magenta)
        list_of_names = []
        selected_data_gk_array.each_with_index do |element, index|
        list_of_names << "#{index +1}. #{element["first_name"]} #{element["second_name"]}"
        end
        puts list_of_names
        chosen_player_number = gets.chomp.to_i
        if chosen_player_number <= list_of_names.length && chosen_player_number != 0
          chosen_player_name = selected_data_gk_array[chosen_player_number - 1]["second_name"]
          Player.all.each do |player_obj|
            if player_obj.second_name == chosen_player_name && player_obj.element_type == 1
              Selection.create(team_id: self.id, player_id: player_obj.id)
              puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n".colorize(:green)
            end
          end
        else
          puts "\nInvalid number. Please select again from list.\n".colorize(:red)
          self.pick_goal_keeper
        end
      end


    def pick_defender
      puts "\nPick your defender by typing their number.\n".colorize(:magenta)
      list_of_names = []
      selected_data_def_array.each_with_index do |element, index|
      list_of_names << "#{index + 1}. #{element["first_name"]} #{element["second_name"]}"
      end
      puts list_of_names
      chosen_player_number = gets.chomp.to_i
      if chosen_player_number <= list_of_names.length && chosen_player_number != 0
    chosen_player_name = selected_data_def_array[chosen_player_number - 1]["second_name"]
        Player.all.each do |player_obj|
          if player_obj.second_name == chosen_player_name && player_obj.element_type == 2
          Selection.create(team_id: self.id, player_id: player_obj.id)
          puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n".colorize(:green)
        end
      end
      else
        puts "\nInvalid number. Please select again from list.\n".colorize(:red)
        self.pick_defender
      end
    end

    def pick_midfielder(turn)
      puts "\nPick your #{turn} midfielder by typing their number.\n".colorize(:magenta)
      list_of_names = []
      selected_data_mid_array.each_with_index do |element, index|
      list_of_names << "#{index +1}. #{element["first_name"]} #{element["second_name"]}"
      end
      puts list_of_names
      chosen_player_number = gets.chomp.to_i

      if chosen_player_number <= list_of_names.length && chosen_player_number != 0
    chosen_player_name = selected_data_mid_array[chosen_player_number - 1]["second_name"]
        player_obj = Player.all.find{|player| player.second_name == chosen_player_name }
        # Player.all.each do |player_obj|
        #   if player_obj.second_name == chosen_player_name && player_obj.element_type == 3
        if player_obj.teams.any?{|team| team == self}
          puts "You have already selected this player. Please choose another player.".colorize(:red)
          pick_midfielder(turn)
        else
          Selection.create(team_id: self.id, player_id: player_obj.id)
          puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n".colorize(:green)
        end
      else
        puts "\nInvalid number. Please select again from list.\n".colorize(:red)
        self.pick_midfielder(turn)
      end
    end

    def pick_striker
      puts "\nPick your striker by typing their number.\n"
      list_of_names = []
      selected_data_strike_array.each_with_index do
        |element, index| list_of_names << "#{index +1}. #{element["first_name"]} #{element["second_name"]}"
      end

      puts list_of_names
      chosen_player_number = gets.chomp.to_i
      if chosen_player_number <= list_of_names.length && chosen_player_number != 0
    chosen_player_name = selected_data_strike_array[chosen_player_number - 1]["second_name"]
        Player.all.each do |player_obj|
          if player_obj.second_name == chosen_player_name && player_obj.element_type == 4
          Selection.create(team_id: self.id, player_id: player_obj.id)
          puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n".colorize(:green)
        end
      end
      else
        puts "\nInvalid number. Please select again from list.\n".colorize(:red)
        self.pick_striker
      end
    end

end
