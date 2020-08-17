if not mods['space-exploration'] then
  return
end

if data.raw.technology['se-material-science-pack-1'] then
  
  --for _i, prereq in pairs(data.raw.technology['sct-lab-t4'].prerequisites) do
  --  if prereq and prereq == 'tungsten-processing' then
  --    table.remove(data.raw.technology['sct-lab-t4'].prerequisites, _i)
  --  end
  --end
  for _i, prereq in pairs(data.raw.technology['tungsten-processing'].prerequisites) do
    if prereq and prereq == 'se-material-science-pack-1' then
	  table.remove(data.raw.technology['tungsten-processing'].prerequisites, _i)
	end
  end
  -- RCUs require black circuits, which can't be researched except in space, which needs RCUs.
  bobmods.lib.recipe.remove_ingredient("rocket-control-unit", "advanced-processing-unit")
  -- also RCUs shouldn't need speed2, that makes them very expensive.
  bobmods.lib.recipe.remove_ingredient("rocket-control-unit", "speed-module-2")
  bobmods.lib.recipe.add_ingredient("rocket-control-unit", "speed-module")
  
  -- Purple science shouldn't need material science (space).
  bobmods.lib.tech.remove_science_pack("production-science-pack", "se-material-science-pack-1")
  bobmods.lib.tech.remove_science_pack("production-science-pack", "space-science-pack")
  bobmods.lib.tech.remove_science_pack("sct-lab-t4", "se-material-science-pack-1")
  bobmods.lib.tech.remove_science_pack("sct-lab-t4", "space-science-pack")
  -- Logistic bots should be available before space.
  bobmods.lib.tech.remove_science_pack("utility-science-pack", "se-material-science-pack")
  bobmods.lib.tech.remove_science_pack("utility-science-pack", "space-science-pack")
  bobmods.lib.tech.remove_science_pack("logistic-robotics", "utility-science-pack")
  bobmods.lib.tech.remove_science_pack("logistic-robotics", "se-material-science-pack")
  bobmods.lib.tech.remove_science_pack("logistic-robotics", "space-science-pack")
  bobmods.lib.tech.remove_science_pack("logistic-robotics", "advanced-logistic-science-pack")
  
  bobmods.lib.tech.remove_science_pack("logistic-system", "utility-science-pack")
  bobmods.lib.tech.remove_science_pack("logistic-system", "se-material-science-pack")
  bobmods.lib.tech.remove_science_pack("logistic-system", "space-science-pack")
  bobmods.lib.tech.remove_science_pack("logistic-system", "advanced-logistic-science-pack")
  
  -- Remove tech lock of onerun (yellow) being needed to build a rocket and not able to be built without space
  bobmods.lib.tech.remove_science_pack("tungsten-processing", "se-material-science-pack-1")
  bobmods.lib.tech.remove_science_pack("tungsten-processing", "space-science-pack")
  
  -- Remove tech lock of Commercial AI Implementation (pink) being needed to build rocket science.
  bobmods.lib.tech.remove_science_pack("advanced-logistic-science-pack", "se-material-science-pack")
  bobmods.lib.tech.remove_science_pack("advanced-logistic-science-pack", "space-science-pack")
  
  -- Remove yellow lock on Advanced chemsitry 4 and Nitrogen processing 4
  bobmods.lib.tech.remove_science_pack("angels-advanced-chemistry-4", "utility-science-pack")
  bobmods.lib.tech.remove_science_pack("angels-nitrogen-processing-4", "utility-science-pack")
  
  -- Space Exploration tries to add chem science to the starter techs.
  bobmods.lib.tech.remove_science_pack("sb-startup1", "chemical-science-pack")
  bobmods.lib.tech.remove_prerequisite("sb-startup1", "chemical-science-pack")
  bobmods.lib.tech.remove_science_pack("sb-startup2", "chemical-science-pack")
  bobmods.lib.tech.remove_science_pack("sb-startup4", "chemical-science-pack")
  bobmods.lib.tech.remove_science_pack("bio-wood-processing", "chemical-science-pack")
  bobmods.lib.tech.remove_science_pack("sct-automation-science-pack", "chemical-science-pack")
  bobmods.lib.tech.remove_science_pack("automation", "chemical-science-pack")
  bobmods.lib.tech.remove_science_pack("automation-2", "chemical-science-pack")
  
end

-- Add resin prerequisite for advanced electronics
--table.insert(data.raw.technology['advanced-electronics'].prerequisites, "resin-1")

-- AAI Industries fixes
-- motor needed for burner ore crusher.
bobmods.lib.recipe.remove_ingredient("burner-ore-crusher", "motor")
-- need to be able to craft basic circuit boards
bobmods.lib.tech.add_recipe_unlock("sb-startup1", "basic-circuit-board")
-- startup2 should give inserters
bobmods.lib.tech.add_recipe_unlock("sb-startup2", "inserter")
if data.raw.recipe['basic-transport-belt'] then
  bobmods.lib.tech.add_recipe_unlock("sb-startup2", "basic-transport-belt")
else
  bobmods.lib.tech.add_recipe_unlock("sb-startup2", "transport-belt")
end
bobmods.lib.tech.add_recipe_unlock("bio-wood-processing", "sct-lab-t1")

-- electric motor needed for lab. also burner lab and glass.
bobmods.lib.recipe.remove_ingredient("burner-lab", "motor")
bobmods.lib.recipe.remove_ingredient("lab", "electric-motor")
bobmods.lib.recipe.remove_ingredient("lab", "glass")
bobmods.lib.recipe.remove_ingredient("sct-t0-solvent", "wood")
bobmods.lib.recipe.remove_ingredient("sct-lab1-mechanization", "electric-motor")

-- basic transport belts need motors...which you can't build at the start.
bobmods.lib.recipe.remove_ingredient("basic-transport-belt", "motor")