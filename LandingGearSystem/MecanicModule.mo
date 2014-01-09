within LandingGearSystem;
model MecanicModule

  inner Modelica.Mechanics.MultiBody.World world(
    n={0,0,-1},
    axisColor_x={0,180,0},
    axisColor_y={255,0,0},
    axisColor_z={0,0,255}) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));

  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentCA(r={0.2,0,0}) annotation (
     Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentAB(r={0.35,0,0}) annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,50})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentBE(r={0.95,0,0}) annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-30})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentED(r={-0.3,0,0.5}) annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-70})));

  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteA(
    n={0,1,0},
    useAxisFlange=false) annotation (
     Placement(transformation(extent={{-60,80},{-40,100}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteB(n={0,1,0}) annotation (
     Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,10})));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revoluteE(n={0,1,0})
               annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-70})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteD(n={0,1,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-30})));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation angleCAB(angle=70) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,70})));

  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(r={1,0,0.5}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,10})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed3(r={0.4,0,0.7}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-90})));

  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange=true)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-10})));
  HydraulicRam hydraulicRam(A=0.1, L=0.5)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-20})));
  Modelica.Fluid.Vessels.ClosedVolume volume(
    nPorts=1,
    V=1,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)},
    redeclare package Medium =
        Modelica.Media.CompressibleLiquids.LinearColdWater) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-50})));

  Modelica.Fluid.Sources.FixedBoundary source(
    nPorts = 1,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T=true,
    T=Modelica.SIunits.Conversions.from_degC(20),
    p=system.p_ambient)
    annotation (Placement(transformation(extent={{0,20},{20,40}},
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
    annotation (Placement(transformation(extent={{40,20},{60,40}},     rotation=
           0)));
  Modelica.Blocks.Continuous.FirstOrder PT1(
    T=2,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                                                                   rotation=270,
        origin={70,70})));
  Modelica.Blocks.Logical.TriggeredTrapezoid PumpRPMGenerator(
    rising=3,
    falling=3,
    amplitude=1200,
    offset=0.001) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
        origin={90,30})));
equation
  connect(angleCAB.frame_b, segmentCA.frame_a) annotation (Line(
      points={{0,70},{20,70}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteB.frame_b, segmentBE.frame_a) annotation (Line(
      points={{-50,0},{-50,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteB.frame_a, segmentAB.frame_b) annotation (
     Line(
      points={{-50,20},{-50,40}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentED.frame_b, revoluteD.frame_a) annotation (Line(
      points={{-90,-60},{-90,-40}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteD.frame_b, fixed2.frame_b) annotation (Line(
      points={{-90,-20},{-90,0}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteA.frame_b, segmentAB.frame_a) annotation (Line(
      points={{-40,90},{-30,90},{-30,70},{-50,70},{-50,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentED.frame_a, revoluteE.frame_b)
                                               annotation (Line(
      points={{-90,-80},{-90,-90},{-50,-90},{-50,-80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentBE.frame_b, revoluteE.frame_a)
                                               annotation (Line(
      points={{-50,-40},{-50,-60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(world.frame_b, revoluteA.frame_a) annotation (Line(
      points={{-80,90},{-60,90}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentAB.frame_a, angleCAB.frame_a) annotation (Line(
      points={{-50,60},{-50,70},{-20,70}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_b, fixed3.frame_b) annotation (Line(
      points={{-10,-20},{-10,-80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_a, segmentCA.frame_b) annotation (Line(
      points={{-10,0},{-10,50},{50,50},{50,70},{40,70}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.support, hydraulicRam.M1) annotation (Line(
      points={{-4,-6},{18,-6},{18,9},{31,9}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(fixed.flange, hydraulicRam.M2) annotation (Line(
      points={{40,-20},{31,-20},{31,-9}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(hydraulicRam.H2, volume.ports[1]) annotation (Line(
      points={{49,-9},{49,-40},{50,-40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(source.ports[1],pumps. port_a) annotation (Line(points={{20,30},{40,
          30}},                              color={0,127,255}));
  connect(pumps.port_b, hydraulicRam.H1) annotation (Line(
      points={{60,30},{70,30},{70,9},{49,9}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(PT1.y, pumps.N_in) annotation (Line(
      points={{70,59},{70,50},{50,50},{50,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PumpRPMGenerator.y, PT1.u) annotation (Line(
      points={{90,41},{90,92},{70,92},{70,82}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),      graphics));
end MecanicModule;
