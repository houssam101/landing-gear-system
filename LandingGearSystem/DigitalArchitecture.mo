within LandingGearSystem;
model DigitalArchitecture "Digital Architecture."

  // Cockpit command.
  TriplicatedDigitalInput handle "Cockpit handle button." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,170}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,170})));

  // Maintain the digital response for 20 seconds (on handle activated).
  TriplicatedDigitalInput analogical_switch "Analogical switch." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-170}),
                          iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-170})));

  // Left hydraulic System.
  TriplicatedDigitalInput gear_extended_left "Gear left extanded." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,160}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,160})));
  TriplicatedDigitalInput gear_retracted_left "Gear left retracted." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,140}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,140})));
  TriplicatedDigitalInput gear_shock_absorber_left
    "Gear left schock absorber activated."                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,120}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,120})));
  TriplicatedDigitalInput door_closed_left "Gear left door closed." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,100}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,100})));
  TriplicatedDigitalInput door_open_left "Gear left door open." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,80}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,80})));

  // Right hydraulic System.
  TriplicatedDigitalInput gear_extended_right "Gear right extanded." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,60}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,60})));
  TriplicatedDigitalInput gear_retracted_right "Gear right retracted." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,40}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,40})));
  TriplicatedDigitalInput gear_shock_absorber_right
    "Gear right schock absorber activated."                                                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,20})));
  TriplicatedDigitalInput door_closed_right "Gear right door closed." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,0}),  iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,0})));
  TriplicatedDigitalInput door_open_right "Gear right door open." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-20}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-20})));

  // Front hydraulic System.
  TriplicatedDigitalInput gear_extended_front "Gear front extanded." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-40}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-40})));
  TriplicatedDigitalInput gear_retracted_front "Gear front retracted." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-60}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-60})));
  TriplicatedDigitalInput gear_shock_absorber_front
    "Gear front schock absorber activated."                                                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-80}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-80})));
  TriplicatedDigitalInput door_closed_front "Gear front door closed." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-100}),
                          iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-100})));
  TriplicatedDigitalInput door_open_front "Gear front door open." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-120}),
                          iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-120})));

  // Pressure sensor.
  TriplicatedDigitalInput circuit_pressurized "Circuit pressurized." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-160}),
                          iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-160})));

  // Cockpit lights.
  DigitalOutput gears_locked_down "Green light." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-120,170})));
  DigitalOutput gears_maneuvering "Orange light." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,170})));
  DigitalOutput anomaly "Red light." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-42,170})));

  // Valves orders.
  DigitalOutput general_EV "General electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-170})));
  DigitalOutput close_EV "Close electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-170})));
  DigitalOutput open_EV "Open electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-170})));
  DigitalOutput retract_EV "Retract electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-170})));
  DigitalOutput extend_EV "Extend electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-170})));

  // Computing modules.
  ComputingModule computingModule1 annotation (Placement(transformation(extent={{-6,-48},{108,66}})));
  ComputingModule computingModule2 annotation (Placement(transformation(extent={{-160,-48},{-46,66}})));

  // Valve output merging.
  Modelica.Blocks.Logical.Or or1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-120,-130})));
  Modelica.Blocks.Logical.Or or2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-130})));
  Modelica.Blocks.Logical.Or or3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-130})));
  Modelica.Blocks.Logical.Or or4 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-130})));
  Modelica.Blocks.Logical.Or or5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-130})));

  Modelica.Blocks.Logical.Or or6 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,140})));
  Modelica.Blocks.Logical.Or or7 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,140})));
  Modelica.Blocks.Logical.Or or8 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-42,140})));
equation
  connect(gear_extended_left, computingModule1.gear_extended_left) annotation (
      Line(
      points={{170,160},{142,160},{142,66},{111.562,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_retracted_left, computingModule1.gear_retracted_left)
    annotation (Line(
      points={{170,140},{142,140},{142,58.875},{111.562,58.875}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_shock_absorber_left, computingModule1.gear_shock_absorber_left)
    annotation (Line(
      points={{170,120},{142,120},{142,51.75},{111.562,51.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_closed_left, computingModule1.door_closed_left) annotation (Line(
      points={{170,100},{142,100},{142,44.625},{111.562,44.625}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_open_left, computingModule1.door_open_left) annotation (Line(
      points={{170,80},{142,80},{142,37.5},{111.562,37.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_extended_right, computingModule1.gear_extended_right)
    annotation (Line(
      points={{170,60},{142,60},{142,30.375},{111.562,30.375}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_retracted_right, computingModule1.gear_retracted_right)
    annotation (Line(
      points={{170,40},{142,40},{142,23.25},{111.562,23.25}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_shock_absorber_right, computingModule1.gear_shock_absorber_right)
    annotation (Line(
      points={{170,20},{142,20},{142,16.125},{111.562,16.125}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_closed_right, computingModule1.door_closed_right) annotation (
      Line(
      points={{170,0},{142,0},{142,9},{111.562,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_open_right, computingModule1.door_open_right) annotation (Line(
      points={{170,-20},{142,-20},{142,1.875},{111.562,1.875}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_extended_front, computingModule1.gear_extended_front)
    annotation (Line(
      points={{170,-40},{142,-40},{142,-5.25},{111.562,-5.25}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_retracted_front, computingModule1.gear_retracted_front)
    annotation (Line(
      points={{170,-60},{142,-60},{142,-12.375},{111.562,-12.375}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_shock_absorber_front, computingModule1.gear_shock_absorber_front)
    annotation (Line(
      points={{170,-80},{140,-80},{140,-19.5},{111.562,-19.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_closed_front, computingModule1.door_closed_front) annotation (
      Line(
      points={{170,-100},{140,-100},{140,-26.625},{111.562,-26.625}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_open_front, computingModule1.door_open_front) annotation (Line(
      points={{170,-120},{142,-120},{142,-33.75},{111.562,-33.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(circuit_pressurized, computingModule1.circuit_pressurized)
    annotation (Line(
      points={{170,-160},{142,-160},{142,-48},{111.562,-48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(computingModule1.analogical_switch, analogical_switch) annotation (
      Line(
      points={{100.875,-51.5625},{100.875,-88},{140,-88},{140,-170}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(or1.u2, computingModule2.general_EV) annotation (Line(
      points={{-128,-118},{-128,-90},{-145.75,-90},{-145.75,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or2.u2, computingModule2.close_EV) annotation (Line(
      points={{-88,-118},{-88,-90},{-131.5,-90},{-131.5,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or3.u2, computingModule2.open_EV) annotation (Line(
      points={{-48,-118},{-48,-90},{-117.25,-90},{-117.25,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or4.u2, computingModule2.retract_EV) annotation (Line(
      points={{-8,-118},{-8,-90},{-103,-90},{-103,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or5.u2, computingModule2.extend_EV) annotation (Line(
      points={{32,-118},{32,-90},{-88.75,-90},{-88.75,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or1.u1, computingModule1.general_EV) annotation (Line(
      points={{-120,-118},{-120,-100},{8.25,-100},{8.25,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or2.u1, computingModule1.close_EV) annotation (Line(
      points={{-80,-118},{-80,-100},{22.5,-100},{22.5,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or3.u1, computingModule1.open_EV) annotation (Line(
      points={{-40,-118},{-40,-100},{36.75,-100},{36.75,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or4.u1, computingModule1.retract_EV) annotation (Line(
      points={{0,-118},{0,-100},{51,-100},{51,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or5.u1, computingModule1.extend_EV) annotation (Line(
      points={{40,-118},{40,-100},{65.25,-100},{65.25,-51.5625}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or1.y, general_EV) annotation (Line(
      points={{-120,-141},{-120,-170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or2.y, close_EV) annotation (Line(
      points={{-80,-141},{-80,-170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or3.y, open_EV) annotation (Line(
      points={{-40,-141},{-40,-170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or4.y, retract_EV) annotation (Line(
      points={{0,-141},{0,-170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or5.y, extend_EV) annotation (Line(
      points={{40,-141},{40,-170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(handle, computingModule1.handle) annotation (Line(
      points={{140,170},{140,96},{100.875,96},{100.875,69.5625}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(computingModule2.handle, handle) annotation (Line(
      points={{-53.125,69.5625},{-53.125,96},{140,96},{140,170}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(or6.y, gears_locked_down) annotation (Line(
      points={{-120,151},{-120,170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or7.y, gears_maneuvering) annotation (Line(
      points={{-80,151},{-80,170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(or8.y, anomaly) annotation (Line(
      points={{-42,151},{-42,170},{-42,170}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(computingModule2.gears_locked_down, or6.u1) annotation (Line(
      points={{-145.75,69.5625},{-145.75,114},{-120,114},{-120,128}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(computingModule2.gears_maneuvering, or7.u1) annotation (Line(
      points={{-131.5,69.5625},{-131.5,114},{-80,114},{-80,128}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(computingModule2.anomaly, or8.u1) annotation (Line(
      points={{-117.963,69.5625},{-117.963,114},{-42,114},{-42,128}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(computingModule1.gears_locked_down, or6.u2) annotation (Line(
      points={{8.25,69.5625},{8.25,104},{-112,104},{-112,128}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(computingModule1.gears_maneuvering, or7.u2) annotation (Line(
      points={{22.5,69.5625},{22.5,104},{-72,104},{-72,128}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(computingModule1.anomaly, or8.u2) annotation (Line(
      points={{36.0375,69.5625},{36.0375,104},{-34,104},{-34,128}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(gear_extended_left, computingModule2.gear_extended_left) annotation (
      Line(
      points={{170,160},{-20,160},{-20,66},{-42.4375,66}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_retracted_left, computingModule2.gear_retracted_left)
    annotation (Line(
      points={{170,140},{-20,140},{-20,58.875},{-42.4375,58.875}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_shock_absorber_left, computingModule2.gear_shock_absorber_left)
    annotation (Line(
      points={{170,120},{-20,120},{-20,51.75},{-42.4375,51.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_closed_left, computingModule2.door_closed_left) annotation (Line(
      points={{170,100},{-20,100},{-20,44.625},{-42.4375,44.625}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_open_left, computingModule2.door_open_left) annotation (Line(
      points={{170,80},{-20,80},{-20,37.5},{-42.4375,37.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_extended_right, computingModule2.gear_extended_right)
    annotation (Line(
      points={{170,60},{-20,60},{-20,30.375},{-42.4375,30.375}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_retracted_right, computingModule2.gear_retracted_right)
    annotation (Line(
      points={{170,40},{-20,40},{-20,23.25},{-42.4375,23.25}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_shock_absorber_right, computingModule2.gear_shock_absorber_right)
    annotation (Line(
      points={{170,20},{-20,20},{-20,16.125},{-42.4375,16.125}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_closed_right, computingModule2.door_closed_right) annotation (
      Line(
      points={{170,0},{-20,0},{-20,9},{-42.4375,9}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_open_right, computingModule2.door_open_right) annotation (Line(
      points={{170,-20},{-20,-20},{-20,1.875},{-42.4375,1.875}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_extended_front, computingModule2.gear_extended_front)
    annotation (Line(
      points={{170,-40},{-20,-40},{-20,-5.25},{-42.4375,-5.25}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_retracted_front, computingModule2.gear_retracted_front)
    annotation (Line(
      points={{170,-60},{-20,-60},{-20,-12.375},{-42.4375,-12.375}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gear_shock_absorber_front, computingModule2.gear_shock_absorber_front)
    annotation (Line(
      points={{170,-80},{-20,-80},{-20,-19.5},{-42.4375,-19.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_closed_front, computingModule2.door_closed_front) annotation (
      Line(
      points={{170,-100},{80,-100},{80,-82},{-20,-82},{-20,-26.625},{-42.4375,
          -26.625}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(door_open_front, computingModule2.door_open_front) annotation (Line(
      points={{170,-120},{78,-120},{78,-84},{-20,-84},{-20,-33.75},{-42.4375,
          -33.75}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(circuit_pressurized, computingModule2.circuit_pressurized)
    annotation (Line(
      points={{170,-160},{132,-160},{132,-122},{76,-122},{76,-88},{-20,-88},{
          -20,-48},{-42.4375,-48}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(analogical_switch, computingModule2.analogical_switch) annotation (
      Line(
      points={{140,-170},{140,-138},{62,-138},{62,-108},{-53.125,-108},{-53.125,
          -51.5625}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,
            -160},{160,160}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-160,-160},{160,160}}), graphics={
          Rectangle(
          extent={{-160,160},{160,-160}},
          lineColor={0,0,0},
          fillColor={125,125,125},
          fillPattern=FillPattern.Sphere), Text(
          extent={{-160,160},{160,-160}},
          lineColor={255,255,255},
          fillPattern=FillPattern.Sphere,
          fillColor={125,125,125},
          fontSize=72,
          textString="Digital Module",
          textStyle={TextStyle.Bold})}));
end DigitalArchitecture;
