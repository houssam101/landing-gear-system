within LandingGearSystem.LandingGearSystemTest;
model MecanicModuleTest

  MecanicModule mecanicModule
    annotation (Placement(transformation(extent={{-80,20},{-40,-20}})));
  Modelica.Fluid.Sources.FixedBoundary source(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T=true,
    T=Modelica.SIunits.Conversions.from_degC(20),
    p=system.p_ambient,
    nPorts=2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
        origin={30,10})));
equation
  connect(source.ports[1], mecanicModule.H1) annotation (Line(
      points={{20,8},{-10,8},{-10,-18.9474},{-41,-18.9474}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(mecanicModule.H2, source.ports[2]) annotation (Line(
      points={{-41,18.9474},{-10,18.9474},{-10,12},{20,12}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end MecanicModuleTest;
