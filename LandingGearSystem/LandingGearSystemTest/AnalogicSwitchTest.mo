within LandingGearSystem.LandingGearSystemTest;
model AnalogicSwitchTest

  AnalogicalSwitch switch annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Integer timer_val2(start=0);
  Integer timer_val3(start=0);

equation
  when Clock(0.4) then

    timer_val3 = previous(timer_val3) + 1;

    switch.switch_input = not previous(switch.switch_input);

    switch.handle.val1 = not previous(switch.handle.val1);

    if previous(timer_val2) == 1 then
      timer_val2 = 0;
      switch.handle.val2 = not previous(switch.handle.val2);
    else
      timer_val2 = previous(timer_val2) + 1;
      switch.handle.val2 = previous(switch.handle.val2);
    end if;

    if previous(timer_val3) == 3 then
      timer_val3 = 0;
      switch.handle.val3 = not previous(switch.handle.val3);
    else
      timer_val3 = previous(timer_val3) + 1;
      switch.handle.val3 = previous(switch.handle.val3);
    end if;

  end when;

end AnalogicSwitchTest;
