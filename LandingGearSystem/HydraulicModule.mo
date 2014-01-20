within LandingGearSystem;
model HydraulicModule

  Modelica.Fluid.Machines.SweptVolume sweptVolume(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    nPorts=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)},
    clearance=0.001,
    pistonCrossArea=0.0125)
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));

  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_nominal=5,
    opening_min=0,
    dp_nominal=100000)
    annotation (Placement(transformation(extent={{-20,-60},{0,-80}})));

  Modelica.Blocks.MathBoolean.Not nor1
    annotation (Placement(transformation(extent={{6,-94},{14,-86}})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete2(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    opening_min=0,
    m_flow_nominal=50,
    dp_nominal=200000)
    annotation (Placement(transformation(extent={{20,-60},{40,-80}})));

  Modelica.Mechanics.Translational.Components.Spring spring(
    s_rel(start=0.268),
    c=5000,
    s_rel0=0.30) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,10})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={10,30})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-10,100},{10,120}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-10,-120},{10,-100}})));
  Modelica.Blocks.Interfaces.BooleanInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={52,10})));
equation
  connect(valveDiscrete.port_b, sweptVolume.ports[1]) annotation (Line(
      points={{0,-70},{8,-70},{8,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(nor1.u, valveDiscrete.open) annotation (Line(
      points={{4.4,-90},{-10,-90},{-10,-78}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(valveDiscrete2.port_a, sweptVolume.ports[2]) annotation (Line(
      points={{20,-70},{12,-70},{12,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(spring.flange_b, sweptVolume.flange) annotation (Line(
      points={{10,1.33227e-15},{10,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(fixed.flange, spring.flange_a) annotation (Line(
      points={{10,30},{10,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(nor1.y, valveDiscrete2.open) annotation (Line(
      points={{14.8,-90},{30,-90},{30,-78}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(spring.flange_b, flange_a) annotation (Line(
      points={{10,1.33227e-15},{42,1.33227e-15},{42,4.44089e-16},{110,
          4.44089e-16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(valveDiscrete.port_a, port_a) annotation (Line(
      points={{-20,-70},{-30,-70},{-30,70},{0,70},{0,110}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valveDiscrete2.port_b, port_b) annotation (Line(
      points={{40,-70},{50,-70},{50,-110},{0,-110}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(u, valveDiscrete.open) annotation (Line(
      points={{-120,8.88178e-16},{-90,8.88178e-16},{-90,0},{-60,0},{-60,-90},{
          -10,-90},{-10,-78}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(spring.flange_b, relPositionSensor.flange_b) annotation (Line(
      points={{10,1.33227e-15},{42,1.33227e-15},{42,4.44089e-16},{52,
          1.27676e-15}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(relPositionSensor.flange_a, spring.flange_a) annotation (Line(
      points={{52,20},{10,20}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HydraulicModule;
