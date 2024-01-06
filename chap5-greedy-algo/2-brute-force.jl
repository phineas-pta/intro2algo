#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/brute-force-recursion-example
function makeChange(coins::Vector{<:Integer}, amount::Integer)::Integer

	function recurse(value::Integer)::Integer
		if value == 0 return 0 end
		minCoins = -1
		for coin ∈ coins
			tmp = value - coin
			if tmp ≥ 0
				currMinCoins = recurse(tmp)
				if minCoins == -1 || currMinCoins < minCoins
					minCoins = currMinCoins
				end
			end
		end
		return minCoins + 1
	end

	return recurse(amount)
end

@assert makeChange([10, 6, 1], 12) == 2
@assert makeChange([10, 6, 1], 21) == 3
