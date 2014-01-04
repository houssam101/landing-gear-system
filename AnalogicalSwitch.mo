within LandingGearSystem;
model AnalogicalSwitch
  "Protect the system against abnormal behavior of the digital part."

  type State = enumeration(
      OPEN,
      CLOSED,
      INTERMEDIATE1,
      INTERMEDIATE2);

  DigitalInput handle annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,110})));
  TriplicatedDigitalOutput state
    annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  DigitalInput switch_in
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  DigitalOutput switch_out annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,0})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));

  State internal_state(init=CLOSED);

equation
  when Clock(0.4) then

  end when;

end AnalogicalSwitch;
