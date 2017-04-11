def change_count(change, idx, denoms)
  return 1 if idx == 0
  return 0 if change <  0
  change_count(change - denoms[idx], idx, denoms) +
    change_count(change, idx - 1, denoms)
end

denoms = [1, 2, 5, 10, 20, 50, 100, 200]
change_count(200, 7, denoms)
