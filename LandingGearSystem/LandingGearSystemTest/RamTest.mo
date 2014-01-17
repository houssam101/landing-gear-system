within LandingGearSystem.LandingGearSystemTest;
model RamTest
  Modelica.Fluid.Machines.SweptVolume sweptVolume(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    nPorts=2,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)},
    clearance=0.001,
    pistonCrossArea=0.005)
    annotation (Placement(transformation(extent={{76,-38},{96,-18}})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Fluid.Sources.FixedBoundary source(
    nPorts=1,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T=true,
    T=Modelica.SIunits.Conversions.from_degC(20),
    p=system.p_ambient)
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}},
          rotation=0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    allowFlowReversal=true,
    length=100,
    height_ab=50,
    diameter=0.3)
    annotation (Placement(transformation(
        origin={-30,-71},
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
    nParallel=1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)
    annotation (Placement(transformation(extent={{-68,-100},{-48,-80}},rotation=
           0)));
  Modelica.Fluid.Vessels.OpenTank reservoir(
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    T_start=Modelica.SIunits.Conversions.from_degC(20),
    use_portsData=true,
    crossArea=50,
    level_start=2.2,
    height=3,
    nPorts=3,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.3),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.3),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})
    annotation (Placement(transformation(extent={{-20,-36},{0,-16}},
                                                                   rotation=0)));
  Modelica.Blocks.Sources.Constant RelativePressureSetPoint(k=2e4)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}}, rotation=
            0)));
  Modelica.Blocks.Logical.OnOffController controller(bandwidth=4000,
      pre_y_start=false)
                        annotation (Placement(transformation(extent={{-40,40},{
            -20,60}}, rotation=0)));
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
    annotation (Placement(transformation(extent={{10,10},{-10,-10}}, rotation=180,
        origin={20,-28})));
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
  Modelica.Blocks.Sources.BooleanPulse booleanPulse(width=50, period=6)
    annotation (Placement(transformation(extent={{0,-80},{20,-60}})));
  Modelica.Blocks.MathBoolean.Not nor1
    annotation (Placement(transformation(extent={{34,-80},{42,-72}})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete2(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    opening_min=0,
    m_flow_nominal=50,
    dp_nominal=200000)
    annotation (Placement(transformation(extent={{100,-58},{120,-78}})));
  Modelica.Mechanics.Translational.Components.Spring spring(
    s_rel0=0.25,
    s_rel(start=0.268, fixed=true),
    c=500) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={86,14})));
  Modelica.Fluid.Vessels.OpenTank tank(
    level_start=0,
    nPorts=1,
    height=10,
    crossArea=1,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)})
    annotation (Placement(transformation(extent={{180,-24},{202,-2}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{108,50},{128,70}})));
equation
  connect(source.ports[1],pumps. port_a) annotation (Line(points={{-80,-90},{
          -80,-90},{-68,-90}},               color={0,127,255}));
  connect(RelativePressureSetPoint.y,controller. reference)
                                                    annotation (Line(points={{-79,50},
          {-60,50},{-60,56},{-42,56}},         color={0,0,127}));
  connect(controller.y,PumpRPMGenerator. u)
    annotation (Line(points={{-19,50},{-2,50}}, color={255,0,255}));
  connect(PumpRPMGenerator.y,PT1. u)
    annotation (Line(points={{21,50},{38,50}}, color={0,0,127}));
  connect(PT1.y,pumps. N_in) annotation (Line(points={{61,50},{74,50},{74,10},{
          -58,10},{-58,-80}},          color={0,0,127}));
  connect(pipe.port_a,pumps. port_b)         annotation (Line(points={{-30,-80},
          {-30,-90},{-48,-90}},                color={0,127,255}));
  connect(reservoirPressure.p, controller.u) annotation (Line(
      points={{31,-28},{42,-28},{42,2},{-50,2},{-50,44},{-42,44}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(valveDiscrete.port_b, sweptVolume.ports[1]) annotation (Line(
      points={{58,-54},{84,-54},{84,-38}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(booleanPulse.y, valveDiscrete.open) annotation (Line(
      points={{21,-70},{36,-70},{36,-62},{48,-62}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(nor1.u, valveDiscrete.open) annotation (Line(
      points={{32.4,-76},{30,-76},{30,-70},{36,-70},{36,-62},{48,-62}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pipe.port_b, reservoir.ports[1]) annotation (Line(
      points={{-30,-60},{-30,-46},{-12.6667,-46},{-12.6667,-36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(reservoirPressure.port, reservoir.ports[2]) annotation (Line(
      points={{20,-38},{20,-42},{-10,-42},{-10,-36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valveDiscrete.port_a, reservoir.ports[3]) annotation (Line(
      points={{38,-54},{-7.33333,-54},{-7.33333,-36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(valveDiscrete2.port_a, sweptVolume.ports[2]) annotation (Line(
      points={{100,-68},{96,-68},{96,-38},{88,-38}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(spring.flange_b, sweptVolume.flange) annotation (Line(
      points={{86,4},{86,-18}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(valveDiscrete2.port_b, tank.ports[1]) annotation (Line(
      points={{120,-68},{150,-68},{150,-66},{178,-66},{178,-30},{191,-30},{191,
          -24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(fixed.flange, spring.flange_a) annotation (Line(
      points={{118,60},{102,60},{102,24},{86,24}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(nor1.y, valveDiscrete2.open) annotation (Line(
      points={{42.8,-76},{110,-76}},
      color={255,0,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end RamTest;
