within LandingGearSystem;
model HydraulicModule

  Modelica.Fluid.Machines.SweptVolume sweptVolume(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    nPorts=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)},
    clearance=0.001,
    pistonCrossArea=0.1)
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Fluid.Sources.FixedBoundary source(
    nPorts=1,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T=true,
    T=Modelica.SIunits.Conversions.from_degC(20),
    p=system.p_ambient)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=0,
        origin={-90,-90})));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    allowFlowReversal=true,
    length=100,
    height_ab=50,
    diameter=0.3)
    annotation (Placement(transformation(
        origin={-70,-11},
        extent={{-9,-10},{11,10}},
        rotation=90)));
  Modelica.Fluid.Machines.PrescribedPump
                          pumps(
    checkValve=true,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    N_nominal=1200,
    redeclare function flowCharacteristic =
        Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow (
          V_flow_nominal={0,0.25,0.5}, head_nominal={100,60,0}),
    V=50/1000,
    T_start=Modelica.SIunits.Conversions.from_degC(20),
    use_N_in=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    nParallel=5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},   rotation=90,
        origin={-70,-50})));
  Modelica.Fluid.Vessels.OpenTank reservoir(
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    T_start=Modelica.SIunits.Conversions.from_degC(20),
    use_portsData=true,
    crossArea=50,
    height=3,
    nPorts=3,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.3),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.3),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)},
    level_start=3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                                                                   rotation=270,
        origin={-30,10})));
  Modelica.Blocks.Sources.Constant RelativePressureSetPoint(k=10e5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},  rotation=180,
        origin={-50,90})));
  Modelica.Blocks.Logical.OnOffController controller(
      pre_y_start=false, bandwidth=1)
                        annotation (Placement(transformation(extent={{-80,40},{
            -60,60}}, rotation=0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid PumpRPMGenerator(
    rising=3,
    falling=3,
    amplitude=1200,
    offset=0.001) annotation (Placement(transformation(extent={{0,40},{20,60}},
          rotation=0)));
  Modelica.Fluid.Sensors.Pressure         reservoirPressure(
                                                        redeclare package
      Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}}, rotation=180,
        origin={10,10})));
  Modelica.Blocks.Continuous.FirstOrder PT1(
    T=2,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    k=1)
    annotation (Placement(transformation(extent={{40,40},{60,60}}, rotation=0)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    m_flow_nominal=5,
    opening_min=0,
    dp_nominal=100000)
    annotation (Placement(transformation(extent={{38,-44},{58,-64}})));
  Modelica.Blocks.MathBoolean.Not nor1
    annotation (Placement(transformation(extent={{-14,-76},{-6,-68}})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete2(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    opening_min=0,
    m_flow_nominal=50,
    dp_nominal=200000)
    annotation (Placement(transformation(extent={{80,-42},{100,-62}})));
  Modelica.Mechanics.Translational.Components.Spring spring(
    s_rel(start=0.268),
    c=50000,
    s_rel0=0.25) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,10})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,90})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.BooleanInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(source.ports[1],pumps. port_a) annotation (Line(points={{-80,-90},{
          -80,-74},{-80,-60},{-70,-60}},     color={0,127,255}));
  connect(controller.y,PumpRPMGenerator. u)
    annotation (Line(points={{-59,50},{-59,50},{-2,50}},
                                                color={255,0,255}));
  connect(PumpRPMGenerator.y,PT1. u)
    annotation (Line(points={{21,50},{38,50}}, color={0,0,127}));
  connect(PT1.y,pumps. N_in) annotation (Line(points={{61,50},{70,50},{70,28},{
          -90,28},{-90,-50},{-80,-50}},color={0,0,127}));
  connect(pipe.port_a,pumps. port_b)         annotation (Line(points={{-70,-20},
          {-70,-40}},                          color={0,127,255}));
  connect(reservoirPressure.p, controller.u) annotation (Line(
      points={{-1,10},{-10,10},{-10,32},{-90,32},{-90,44},{-82,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valveDiscrete.port_b, sweptVolume.ports[1]) annotation (Line(
      points={{58,-54},{68,-54},{68,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(nor1.u, valveDiscrete.open) annotation (Line(
      points={{-15.6,-72},{-30,-72},{-30,-70},{-30,-70},{-30,-62},{48,-62}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pipe.port_b, reservoir.ports[1]) annotation (Line(
      points={{-70,4.44089e-16},{-70,8},{-40,8},{-40,12.6667}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(reservoirPressure.port, reservoir.ports[2]) annotation (Line(
      points={{10,-4.44089e-16},{10,-10},{-40,-10},{-40,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valveDiscrete.port_a, reservoir.ports[3]) annotation (Line(
      points={{38,-54},{-40,-54},{-40,7.33333}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valveDiscrete2.port_a, sweptVolume.ports[2]) annotation (Line(
      points={{80,-52},{72,-52},{72,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(spring.flange_b, sweptVolume.flange) annotation (Line(
      points={{90,1.33227e-15},{90,-20},{70,-20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(fixed.flange, spring.flange_a) annotation (Line(
      points={{90,90},{90,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(nor1.y, valveDiscrete2.open) annotation (Line(
      points={{-5.2,-72},{90,-72},{90,-72},{90,-72},{90,-60},{90,-60}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(RelativePressureSetPoint.y, controller.reference) annotation (Line(
      points={{-61,90},{-70,90},{-70,70},{-90,70},{-90,56},{-82,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spring.flange_b, flange_a) annotation (Line(
      points={{90,0},{110,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(u, valveDiscrete.open) annotation (Line(
      points={{-120,0},{-96,0},{-96,-72},{-30,-72},{-30,-62},{48,-62}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(valveDiscrete2.port_b, pumps.port_a) annotation (Line(
      points={{100,-52},{110,-52},{110,-90},{-80,-90},{-80,-60},{-70,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HydraulicModule;
