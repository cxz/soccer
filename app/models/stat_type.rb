class StatType

  GROUP_DESC = {
      :general     => 'Games',
      :shots       => 'Shots Records',
      :goaltype    => 'Goals',
      :cautions    => 'Cautions',
      :misc        => 'Miscellaneous',
      :goalie      => 'Goalie'
  }

  DESC = {
      :general_gp => 'Games played',
      :general_gs => 'As starter',

      #shots
      :shots_g     => 'Goals',
      :shots_a     => 'Assists',
      :shots_pts   => 'Points',
      :shots_sh    => 'Attempted',
      :shots_sog   => 'On goal',
      :shots_ps    => 'Penaulty',
      :shots_psatt => 'Penaulty shots',
      :shots_soatt => 'Shootout attempts',

      #goals
      :goaltype_gw  => 'Game winning',
      :goaltype_ua  => 'Unassisted',
      :goaltype_fg  => 'First goaltype',
      :goaltype_ot  => 'Overtime',
      :goaltype_en  => 'Empty net',
      :goaltype_hat => 'Hat tricks',
      :goaltype_gt  => 'Game trying',
      :goaltype_so  => 'Shootout',

      #cautions
      :cautions_yc => 'Yellow',
      :cautions_rc => 'Red',
      :cautions_gc => 'Green',

      #misc
      :misc_minutes => 'Minutes',
      :misc_dsave   => 'Defensive Saves',

      #goalie
      :goalie_gp      => 'Games played',
      :goalie_gs      => 'Starting',
      :goalie_minutes => 'Minutes',
      :goalie_ga      => 'Allowed',
      :goalie_saves   => 'Saves',
      :goalie_gaavg   => 'Goals against average',
      :goalie_svpct   => 'Save percentage',
      :goalie_sho     => 'Shootouts',
      :goalie_w       => 'Wins',
      :goalie_l       => 'Losses',
      :goalie_t       => 'Ties',
      :goalie_sf      => 'Shots faced'
  }

  def StatType.add_item(k, v)
    @hash ||= {}
    @hash[k]=v
  end

  def StatType.const_missing(k)
    @hash[k]
  end

  def StatType.each
    @hash.each{|k, v| yield(k, v)}
  end

end