within LandingGearSystem;
model LandingGearSystem
  HydraulicModule hydraulicModule
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  MecanicModule mecanicModule
    annotation (Placement(transformation(extent={{-20,20},{20,60}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));
  Modelica.Blocks.Interfaces.BooleanInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(hydraulicModule.flange_a, mecanicModule.flange_b) annotation (Line(
      points={{-39,0},{0,0},{0,18.9474}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(mecanicModule.y, y) annotation (Line(
      points={{0,61.0526},{0,110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u, hydraulicModule.u) annotation (Line(
      points={{-120,0},{-62,0}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end LandingGearSystem;
