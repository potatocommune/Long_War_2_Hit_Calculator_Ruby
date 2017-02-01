def fuckyou()
  return "FIX YOUR FUCKING INPUT"
end

def longwar2()
  puts ("INPUT YOUR HIT/CRIT/DODGE Format: (\"HIT CRT DDG)\"")
  hcd_str = gets.chomp()
  
  hcd = hcd_str.split(" ")
  
  hit = hcd[0].to_f / 100
  crit = hcd[1].to_f / 100
  dodge = hcd[2].to_f / 100
  
  if crit > 1 || crit < 0 || dodge > 1 || dodge < 0  
    return fuckyou
  end 
  
  if hit > 0.1 && hit < 0.9
    miss_base_chance = 1 - hit - 0.1
    hit_base_chance = hit - 0.1
    graze_base_chance = 0.2
  elsif hit <= 0.1 
    miss_base_chance = 1 - hit - 0.1 
    hit_base_chance = 0 
    graze_base_chance = 0.1 + hit
  elsif hit >= 0.9 
    miss_base_chance = 0 
    hit_base_chance = hit - 0.1 
    graze_base_chance = 0.1 + 1 - hit
  else 
    return fuckyou
  end 
  
   crit_hit_chance = hit_base_chance * crit 
   normal_hit_chance = hit_base_chance * ( 1 - crit - dodge ) + graze_base_chance * crit 
   graze_hit_chance = graze_base_chance * ( 1 - crit - dodge ) + hit_base_chance * dodge
   miss_hit_chance = miss_base_chance + graze_base_chance * dodge
   
   return "Crit: #{100*crit_hit_chance.round(3)}%, Hit: #{100*normal_hit_chance.round(3)}%, Graze: #{100*graze_hit_chance.round(3)}%, Miss: #{100*miss_hit_chance.round(3)}%"
  
end

puts longwar2
