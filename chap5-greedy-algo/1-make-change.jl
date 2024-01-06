#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/greedy-exercise-solution

# Write a function, makeChange, that returns an integer that represents the least number of coins that add up to the amount  where the amount is always divisible by 5
function makeChange(coins::Vector{<:Integer}, amount::Integer)::Integer
	coins_bis = sort(coins)
	coinTotal = 0
	while amount > 0 && length(coins_bis) > 0
		tmp = pop!(coins_bis)  # take the biggest coin possible
		if tmp ≤ amount
			amount -= tmp
			coinTotal += 1
		end
	end
	return coinTotal
end

@assert makeChange([5, 10, 25], 40) == 3
@assert makeChange([25, 10], 35) == 2
