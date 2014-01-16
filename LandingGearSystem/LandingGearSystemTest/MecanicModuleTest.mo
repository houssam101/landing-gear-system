within LandingGearSystem.LandingGearSystemTest;
model MecanicModuleTest

  MecanicModule mecanicModule(P_coeff=100)
    annotation (Placement(transformation(extent={{-60,20},{-20,-20}})));
  Modelica.Blocks.Continuous.LimIntegrator integrator(outMin=0, outMax=0.25)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={10,0})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=1,
    period=5,
    offset=-0.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,0})));
equation
  connect(integrator.y, mecanicModule.u) annotation (Line(
      points={{-1,0},{-18,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse.y, integrator.u) annotation (Line(
      points={{39,0},{22,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end MecanicModuleTest;
