within LandingGearSystem.LandingGearSystemTest;
model HydraulicModuleTest

  HydraulicModule hydraulicModule
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=50,
    period=10,
    startTime=20)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  PressureModule pressureModule
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
equation
  connect(booleanPulse.y, hydraulicModule.u) annotation (Line(
      points={{-9,0},{8,0}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pressureModule.ports_b, hydraulicModule.port_a) annotation (Line(
      points={{11,40},{40,40},{40,20},{20,20},{20,11}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pressureModule.ports_a, hydraulicModule.port_b) annotation (Line(
      points={{-11,40},{-40,40},{-40,-20},{20,-20},{20,-11}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HydraulicModuleTest;
