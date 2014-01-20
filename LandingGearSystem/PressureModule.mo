within LandingGearSystem;
model PressureModule
  Modelica.Fluid.Machines.SweptVolume sweptVolume(
    clearance=0.01,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    nPorts=3,
    pistonCrossArea=0.4,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.05)},
    V(start=1.5, fixed=true))
    annotation (Placement(transformation(extent={{10,-44},{30,-24}})));

  Modelica.Fluid.Sources.FixedBoundary source(
    nPorts=2,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T=true,
    T=Modelica.SIunits.Conversions.from_degC(20),
    p=system.p_ambient)
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}},
          rotation=0)));
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
    nParallel=1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)
    annotation (Placement(transformation(extent={{-68,-60},{-48,-40}}, rotation=
           0)));
  Modelica.Blocks.Sources.Constant RelativePressureSetPoint(k=10e5)
    annotation (Placement(transformation(extent={{-100,80},{-80,100}},rotation=
            0)));
  Modelica.Blocks.Logical.OnOffController controller(bandwidth=4000,
      pre_y_start=false)
                        annotation (Placement(transformation(extent={{-40,80},{
            -20,100}},rotation=0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid PumpRPMGenerator(
    rising=3,
    falling=3,
    amplitude=1200,
    offset=0.001) annotation (Placement(transformation(extent={{0,80},{20,100}},
          rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder PT1(
    T=2,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0)
    annotation (Placement(transformation(extent={{40,80},{60,100}},rotation=0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Mechanics.Translational.Components.Spring spring(         s_rel0=1, c=100000)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,2})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={20,20})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    allowFlowReversal=false,
    dp_nominal=100000,
    m_flow_nominal=10)
    annotation (Placement(transformation(extent={{-18,-40},{2,-60}})));

  Modelica.Blocks.Sources.BooleanStep booleanStep(startTime=10)
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{28,-50},{48,-30}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=9e5)
    annotation (Placement(transformation(extent={{58,-50},{78,-30}})));
  Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-8,-74})));
  Modelica.Fluid.Interfaces.FluidPorts_b ports_b(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{100,-40},{120,40}})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Modelica.Fluid.Interfaces.FluidPorts_a ports_a(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-120,-40},{-100,40}})));
equation
  connect(source.ports[1],pumps. port_a) annotation (Line(points={{-80,-48},{
          -74,-50},{-68,-50}},               color={0,127,255}));
  connect(RelativePressureSetPoint.y,controller. reference)
                                                    annotation (Line(points={{-79,90},
          {-60,90},{-60,96},{-42,96}},         color={0,0,127}));
  connect(controller.y,PumpRPMGenerator. u)
    annotation (Line(points={{-19,90},{-2,90}}, color={255,0,255}));
  connect(PumpRPMGenerator.y,PT1. u)
    annotation (Line(points={{21,90},{38,90}}, color={0,0,127}));
  connect(PT1.y,pumps. N_in) annotation (Line(points={{61,90},{74,90},{74,50},{
          -58,50},{-58,-40}},          color={0,0,127}));
  connect(pumps.port_b, pressure.port) annotation (Line(
      points={{-48,-50},{-30,-50},{-30,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pressure.p, controller.u) annotation (Line(
      points={{-19,-30},{-6,-30},{-6,36},{-50,36},{-50,84},{-42,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(spring.flange_a, fixed.flange) annotation (Line(
      points={{20,12},{20,20}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(spring.flange_b, sweptVolume.flange) annotation (Line(
      points={{20,-8},{20,-24}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(valveDiscrete.port_a, pressure.port) annotation (Line(
      points={{-18,-50},{-30,-50},{-30,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valveDiscrete.port_b, sweptVolume.ports[1]) annotation (Line(
      points={{2,-50},{17.3333,-50},{17.3333,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pressure1.port, sweptVolume.ports[2]) annotation (Line(
      points={{38,-50},{38,-56},{20,-56},{20,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pressure1.p, lessThreshold.u) annotation (Line(
      points={{49,-40},{56,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valveDiscrete.open, and1.y) annotation (Line(
      points={{-8,-58},{-8,-63}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(booleanStep.y, and1.u1) annotation (Line(
      points={{-79,-90},{-8,-90},{-8,-86}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(lessThreshold.y, and1.u2) annotation (Line(
      points={{79,-40},{92,-40},{92,-62},{54,-62},{54,-100},{0,-100},{0,-86}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(sweptVolume.ports[3], ports_b) annotation (Line(
      points={{22.6667,-44},{22,-44},{22,-56},{96,-56},{96,0},{110,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(source.ports[2], ports_a) annotation (Line(
      points={{-80,-52},{-80,0},{-110,0}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end PressureModule;
