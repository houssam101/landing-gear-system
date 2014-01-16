within LandingGearSystem.LandingGearSystemTest;
model MecanicModuleTest

  MecanicModule mecanicModule(P_coeff=100)
    annotation (Placement(transformation(extent={{-80,20},{-40,-20}})));
  Modelica.Blocks.Sources.Ramp     PressureSetPoint(
    duration=10,
    startTime=1,
    height=0.25)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},  rotation=180,
        origin={70,0})));
equation
  connect(PressureSetPoint.y, mecanicModule.u) annotation (Line(
      points={{59,1.77636e-15},{10,1.77636e-15},{10,8.88178e-16},{-38,
          8.88178e-16}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end MecanicModuleTest;
