within LandingGearSystem.LandingGearSystemTest;
model MecanicModuleTest

  MecanicModule mecanicModule annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={40,20})));
  HydraulicModule hydraulicModule
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=50, period=6)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
equation
  connect(hydraulicModule.flange_a, mecanicModule.flange_b) annotation (Line(
      points={{1,-30},{40,-30},{40,-1.05263}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(booleanPulse.y, hydraulicModule.u) annotation (Line(
      points={{-39,-30},{-22,-30}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end MecanicModuleTest;
