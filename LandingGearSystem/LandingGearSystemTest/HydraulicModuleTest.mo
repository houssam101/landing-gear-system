within LandingGearSystem.LandingGearSystemTest;
model HydraulicModuleTest

  HydraulicModule hydraulicModule
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=50, period=6)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
equation
  connect(booleanPulse.y, hydraulicModule.u) annotation (Line(
      points={{-9,0},{8,0}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HydraulicModuleTest;
