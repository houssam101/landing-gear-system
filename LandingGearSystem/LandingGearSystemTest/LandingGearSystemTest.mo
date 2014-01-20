within LandingGearSystem.LandingGearSystemTest;
model LandingGearSystemTest
  LandingGearSystem landingGearSystem
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(
    width=50,
    startTime=0,
    period=10)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(landingGearSystem.u, booleanPulse.y) annotation (Line(
      points={{-24,0},{-59,0}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end LandingGearSystemTest;
