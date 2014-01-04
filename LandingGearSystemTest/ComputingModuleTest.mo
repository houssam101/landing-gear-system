within LandingGearSystem.LandingGearSystemTest;
model ComputingModuleTest

  ComputingModule module;

equation
  when sample(0,1/3) then

    module.handle.val1 = true;
    module.analogical_switch.val1 = true;
    module.gear_extended_left.val1 = true;
    module.gear_retracted_left.val1 = true;
    module.gear_shock_absorber_left.val1 = true;
    module.door_closed_left.val1 = true;
    module.door_open_left.val1 = true;
    module.gear_extended_right.val1 = true;
    module.gear_retracted_right.val1 = true;
    module.gear_shock_absorber_right.val1 = true;
    module.door_closed_right.val1 = true;
    module.door_open_right.val1 = true;
    module.gear_extended_front.val1 = true;
    module.gear_retracted_front.val1 = true;
    module.gear_shock_absorber_front.val1 = true;
    module.door_closed_front.val1 = true;
    module.door_open_front.val1 = true;
    module.circuit_pressurized.val1 = true;

    module.handle.val2 = true;
    module.analogical_switch.val2 = true;
    module.gear_extended_left.val2 = true;
    module.gear_retracted_left.val2 = true;
    module.gear_shock_absorber_left.val2 = true;
    module.door_closed_left.val2 = true;
    module.door_open_left.val2 = true;
    module.gear_extended_right.val2 = true;
    module.gear_retracted_right.val2 = true;
    module.gear_shock_absorber_right.val2 = true;
    module.door_closed_right.val2 = true;
    module.door_open_right.val2 = true;
    module.gear_extended_front.val2 = true;
    module.gear_retracted_front.val2 = true;
    module.gear_shock_absorber_front.val2 = true;
    module.door_closed_front.val2 = true;
    module.door_open_front.val2 = true;
    module.circuit_pressurized.val2 = true;

    module.handle.val3 = true;
    module.analogical_switch.val3 = true;
    module.gear_extended_left.val3 = true;
    module.gear_retracted_left.val3 = true;
    module.gear_shock_absorber_left.val3 = true;
    module.door_closed_left.val3 = true;
    module.door_open_left.val3 = true;
    module.gear_extended_right.val3 = true;
    module.gear_retracted_right.val3 = true;
    module.gear_shock_absorber_right.val3 = true;
    module.door_closed_right.val3 = true;
    module.door_open_right.val3 = true;
    module.gear_extended_front.val3 = true;
    module.gear_retracted_front.val3 = true;
    module.gear_shock_absorber_front.val3 = true;
    module.door_closed_front.val3 = true;
    module.door_open_front.val3 = true;
    module.circuit_pressurized.val3 = true;

  end when;

end ComputingModuleTest;
