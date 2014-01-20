within LandingGearSystem.LandingGearSystemTest;
model DCMotorTest

  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=2)
    annotation (Placement(transformation(extent={{52,14},{72,34}})));
  Modelica.Blocks.Sources.Ramp ramp(height=20, duration=4)
    annotation (Placement(transformation(extent={{-80,14},{-60,34}})));
  Modelica.Blocks.Continuous.PID PID(
    k=2,
    Ti=1000,
    Td=0.001)
    annotation (Placement(transformation(extent={{-32,14},{-12,34}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=3)
    annotation (Placement(transformation(extent={{24,14},{44,34}})));
  DCMotor dCMotor
    annotation (Placement(transformation(extent={{-2,14},{18,34}})));
equation
  connect(idealGear.flange_b,inertia. flange_a) annotation (Line(
      points={{44,24},{52,24}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(idealGear.flange_a, dCMotor.flange) annotation (Line(
      points={{24,24},{19,24}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ramp.y, PID.u) annotation (Line(
      points={{-59,24},{-34,24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID.y, dCMotor.v) annotation (Line(
      points={{-11,24},{-4,24}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end DCMotorTest;
