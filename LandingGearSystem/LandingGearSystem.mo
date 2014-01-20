within LandingGearSystem;
model LandingGearSystem
  MecanicModule mecanicModule
    annotation (Placement(transformation(extent={{50,28},{90,68}})));
  Modelica.Blocks.Interfaces.BooleanInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-10,-22},{10,-2}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-48,6},{-28,26}})));
  Modelica.Blocks.Sources.Constant const1(k=-1)
    annotation (Placement(transformation(extent={{-76,-30},{-56,-10}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    outMax=0.5,
    outMin=0.25,
    y_start=0.25,
    k=1)
    annotation (Placement(transformation(extent={{30,-22},{50,-2}})));
  Modelica.Blocks.Math.Add add(k1=1, k2=-1)
    annotation (Placement(transformation(extent={{-42,-72},{-22,-52}})));
  DriverModule driverModule(startL=0.25, gain=300)
    annotation (Placement(transformation(extent={{50,-72},{70,-52}})));
equation
  connect(u, switch1.u2) annotation (Line(
      points={{-120,1.11022e-15},{-88,1.11022e-15},{-88,0},{-50,0},{-50,-12},{
          -12,-12}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(const1.y, switch1.u3) annotation (Line(
      points={{-55,-20},{-12,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, switch1.u1) annotation (Line(
      points={{-27,16},{-26,16},{-26,-4},{-12,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, limIntegrator.u) annotation (Line(
      points={{11,-12},{28,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(mecanicModule.y, add.u2) annotation (Line(
      points={{70,69.0526},{70,78},{-100,78},{-100,-68},{-44,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limIntegrator.y, add.u1) annotation (Line(
      points={{51,-12},{60,-12},{60,18},{0,18},{0,38},{-80,38},{-80,-56},{-44,
          -56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(driverModule.flange_a, mecanicModule.flange_b) annotation (Line(
      points={{71,-62},{100,-62},{100,16},{70,16},{70,26.9474}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(driverModule.speed, add.y) annotation (Line(
      points={{48,-62},{-21,-62}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end LandingGearSystem;
