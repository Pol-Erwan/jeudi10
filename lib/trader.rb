def trader

  price = [17,3,6,9,15,8,6,1,10]

  day = [1,2,3,4,5,6,7,8,9]
  
  trader = Hash[day.zip(price)] 
  
  test = Hash.new

  trader.each do |test|
  
  print test[0]
  puts " => #{test [1]}"

  
  end
  p trader

  achat = 0
  b = 0
  tableau = []
  while achat < (price.size - 1)
    vente = achat + 1
      while vente < (price.size - 1)

        a = [price [vente] - price [achat]]           
        #puts "achat day #{achat} vente day #{vente}"
        #puts a
        tableau [b] = "#{a}"
        b = b + 1
        vente = vente + 1
      end  
      achat = achat + 1
  end
  print tableau
  puts tableau.max
  #puts trader.min
  #puts trader.max
end


def day_trader

$15 - $3 == $12

end

#day_trader
trader
