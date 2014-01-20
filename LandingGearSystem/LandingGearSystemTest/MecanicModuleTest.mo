within LandingGearSystem.LandingGearSystemTest;
model MecanicModuleTest

  Modelica.Mechanics.Translational.Sources.Position position
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    outMax=0.5,
    outMin=0.25,
    y_start=0.25,
    k=0.5) annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=1,
    width=50,
    period=5,
    offset=-0.5,
    startTime=1)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  MecanicModule mecanicModule annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={50,30})));
equation
  connect(limIntegrator.y, position.s_ref) annotation (Line(
      points={{-19,-30},{-2,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pulse.y, limIntegrator.u) annotation (Line(
      points={{-59,-30},{-42,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(position.flange, mecanicModule.flange_b) annotation (Line(
      points={{20,-30},{50,-30},{50,8.94737}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end MecanicModuleTest;
