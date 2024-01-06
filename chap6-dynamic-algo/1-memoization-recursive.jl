#!/usr/bin/env -S julia --color=yes --threads=auto --startup-file=no

# https://replit.com/@bgando/dp-memo-example
function makeChange(coins::Vector{<:Integer}, amount::Integer)::Integer
	cache = Dict{Integer, Integer}()

	function recurse(c::Integer)::Integer
		if !haskey(cache, c)
			minCoins = -1

			# find the best coin
			for coin ∈ coins
				tmp = c - coin
				if tmp ≥ 0
					currMinCoins = recurse(tmp)
					if minCoins == -1 || currMinCoins < minCoins
						minCoins = currMinCoins
					end
				end
			end

			# caching
			cache[c] = minCoins + 1
		end
		return cache[c]
	end

	return recurse(amount)
end

@assert makeChange([10, 6, 1], 12) == 2
@assert makeChange([10, 6, 1], 21) == 3
