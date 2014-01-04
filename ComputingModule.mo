within LandingGearSystem;
model ComputingModule "Computing Module."

  // Inputs.
  TriplicatedDigitalInput handle "Cockpit handle button." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,170}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={140,170})));
  TriplicatedDigitalInput analogical_switch "Analogical switch." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-170}),
                          iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-170})));
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
  TriplicatedDigitalInput circuit_pressurized "Circuit pressurized." annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-160}),
                          iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={170,-160})));

  // Outputs.
  DigitalOutput gears_locked_down "Green light." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-120,170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-120,170})));
  DigitalOutput gears_maneuvering "Orange light." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,170})));
  DigitalOutput anomaly "Red light." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-42,170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-42,170})));
  DigitalOutput general_EV "General electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-170})));
  DigitalOutput close_EV "Close electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-170})));
  DigitalOutput open_EV "Open electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-170})));
  DigitalOutput retract_EV "Retract electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-170})));
  DigitalOutput extend_EV "Extend electro valve." annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-170}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-170})));
  annotation (Icon(coordinateSystem(extent={{-160,-160},{160,160}}), graphics={
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
          textStyle={TextStyle.Bold},
          textString="Computing Module")}), Diagram(coordinateSystem(extent={{
            -160,-160},{160,160}})));

equation
  gears_locked_down = true;
  gears_maneuvering = true;
  anomaly = false;
  general_EV = false;
  close_EV = true;
  open_EV = false;
  retract_EV = false;
  extend_EV= false;

end ComputingModule;
