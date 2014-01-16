within LandingGearSystem;
model HydraulicModule
  Modelica.Fluid.Machines.PrescribedPump
                          pumps(
    checkValve=true,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    redeclare function flowCharacteristic =
        Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow (
          V_flow_nominal={0,0.25,0.5}, head_nominal={100,60,0}),
    V=50/1000,
    T_start=Modelica.SIunits.Conversions.from_degC(20),
    use_N_in=true,
    nParallel=1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    rho_nominal=1000,
    N_nominal=1800)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}}, rotation=
           0)));
  Modelica.Blocks.Continuous.FirstOrder PT1(
    T=2,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    k=0.1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                                                                   rotation=270,
        origin={-50,10})));
  Modelica.Blocks.Logical.TriggeredTrapezoid PumpRPMGenerator(
    rising=3,
    falling=3,
    offset=0.001,
    amplitude=2500)
                  annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
        origin={-10,30})));
  Modelica.Blocks.Logical.OnOffController controller(pre_y_start=true,
      bandwidth=0.1)    annotation (Placement(transformation(extent={{-10,10},{
            10,-10}}, rotation=180,
        origin={50,30})));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Fluid.Sources.FixedBoundary source(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T=true,
    T=Modelica.SIunits.Conversions.from_degC(20),
    p=system.p_ambient,
    nPorts=2)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{100,80},{120,100}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{100,-100},{120,-80}})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(source.ports[1],pumps. port_a) annotation (Line(points={{-80,-28},{
          -80,-30},{-60,-30}},               color={0,127,255}));
  connect(PT1.y,pumps. N_in) annotation (Line(
      points={{-50,-1},{-50,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PumpRPMGenerator.y,PT1. u) annotation (Line(
      points={{-21,30},{-50,30},{-50,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(controller.y,PumpRPMGenerator. u) annotation (Line(
      points={{39,30},{2,30}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(pressure.port,pumps. port_b) annotation (Line(
      points={{10,-20},{10,-30},{-40,-30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_a, pumps.port_b) annotation (Line(
      points={{110,90},{110,-30},{-40,-30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_b, source.ports[2]) annotation (Line(
      points={{110,-90},{-70,-90},{-70,-32},{-80,-32}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(controller.reference, u) annotation (Line(
      points={{62,36},{70,36},{70,50},{-70,50},{-70,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(controller.u, pressure.p) annotation (Line(
      points={{62,24},{70,24},{70,10},{30,10},{30,-10},{21,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HydraulicModule;
