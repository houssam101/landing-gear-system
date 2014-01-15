within LandingGearSystem;
model MecanicModule

  inner Modelica.Mechanics.MultiBody.World world(
    n={0,0,-1},
    axisColor_x={0,180,0},
    axisColor_y={255,0,0},
    axisColor_z={0,0,255}) annotation (Placement(transformation(extent={{-200,
            180},{-180,200}})));

  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentCA(r={0.2,0,0}) annotation (
     Placement(transformation(extent={{-80,160},{-60,180}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentAB(r={0.35,0,0}) annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-150,150})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentBE(r={0.95,0,0}) annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-150,70})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentED(r={-0.3,0,0.5}) annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-190,30})));

  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteA(
    n={0,1,0},
    useAxisFlange=false) annotation (
     Placement(transformation(extent={{-160,180},{-140,200}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteB(n={0,1,0}) annotation (
     Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-150,110})));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revoluteE(n={0,1,0})
               annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-150,30})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteD(n={0,1,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-190,70})));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation angleCAB(angle=70) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,170})));

  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(r={1,0,0.5}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-190,110})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed3(r={0.4,0,0.7}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-110,10})));

  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange=true)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-110,90})));
  HydraulicRam hydraulicRam(A=0.1, L=0.5)
    annotation (Placement(transformation(extent={{-70,90},{-50,110}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,70})));

  Modelica.Fluid.Sources.FixedBoundary source(
    nPorts=2,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_T=true,
    T=Modelica.SIunits.Conversions.from_degC(20),
    p=system.p_ambient)
    annotation (Placement(transformation(extent={{-100,120},{-80,140}},
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
    annotation (Placement(transformation(extent={{-40,120},{-20,140}}, rotation=
           0)));
  Modelica.Blocks.Continuous.FirstOrder PT1(
    T=2,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                                                                   rotation=270,
        origin={-30,170})));
  Modelica.Blocks.Logical.TriggeredTrapezoid PumpRPMGenerator(
    rising=3,
    falling=3,
    amplitude=1200,
    offset=0.001) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
        origin={10,190})));
  Modelica.Blocks.Logical.OnOffController controller(bandwidth=4000,
      pre_y_start=false)
                        annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, rotation=180,
        origin={90,190})));
  Modelica.Blocks.Sources.Constant PressureSetPoint(k=2e4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},  rotation=180,
        origin={150,190})));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{80,140},{100,160}})));
equation
  connect(angleCAB.frame_b, segmentCA.frame_a) annotation (Line(
      points={{-100,170},{-80,170}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteB.frame_b, segmentBE.frame_a) annotation (Line(
      points={{-150,100},{-150,80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteB.frame_a, segmentAB.frame_b) annotation (
     Line(
      points={{-150,120},{-150,140}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentED.frame_b, revoluteD.frame_a) annotation (Line(
      points={{-190,40},{-190,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteD.frame_b, fixed2.frame_b) annotation (Line(
      points={{-190,80},{-190,100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteA.frame_b, segmentAB.frame_a) annotation (Line(
      points={{-140,190},{-130,190},{-130,170},{-150,170},{-150,160}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentED.frame_a, revoluteE.frame_b)
                                               annotation (Line(
      points={{-190,20},{-190,10},{-150,10},{-150,20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentBE.frame_b, revoluteE.frame_a)
                                               annotation (Line(
      points={{-150,60},{-150,40}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(world.frame_b, revoluteA.frame_a) annotation (Line(
      points={{-180,190},{-160,190}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentAB.frame_a, angleCAB.frame_a) annotation (Line(
      points={{-150,160},{-150,170},{-120,170}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_b, fixed3.frame_b) annotation (Line(
      points={{-110,80},{-110,20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_a, segmentCA.frame_b) annotation (Line(
      points={{-110,100},{-110,150},{-50,150},{-50,170},{-60,170}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.support, hydraulicRam.M1) annotation (Line(
      points={{-104,94},{-82,94},{-82,109},{-69,109}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(fixed.flange, hydraulicRam.M2) annotation (Line(
      points={{-70,70},{-69,70},{-69,91}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(source.ports[1],pumps. port_a) annotation (Line(points={{-80,132},{
          -60,130},{-40,130}},               color={0,127,255}));
  connect(PT1.y, pumps.N_in) annotation (Line(
      points={{-30,159},{-30,140}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PumpRPMGenerator.y, PT1.u) annotation (Line(
      points={{-1,190},{-1,192},{-30,192},{-30,182}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(controller.y, PumpRPMGenerator.u) annotation (Line(
      points={{79,190},{22,190}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(controller.u, PressureSetPoint.y) annotation (Line(
      points={{102,196},{122,196},{122,190},{139,190}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pressure.p, controller.reference) annotation (Line(
      points={{101,150},{110,150},{110,184},{102,184}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hydraulicRam.H1, pumps.port_b) annotation (Line(
      points={{-51,109},{30,109},{30,130},{-20,130}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pressure.port, pumps.port_b) annotation (Line(
      points={{90,140},{90,130},{-20,130}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hydraulicRam.H2, source.ports[2]) annotation (Line(
      points={{-51,91},{-44,91},{-44,128},{-80,128}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -180},{200,200}}),      graphics), Icon(coordinateSystem(extent={{
            -200,-180},{200,200}})));
end MecanicModule;
