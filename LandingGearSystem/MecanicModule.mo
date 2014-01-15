within LandingGearSystem;
model MecanicModule





  Modelica.Mechanics.MultiBody.Parts.Fixed fixed3(r={0.4,0,0.7}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={70,10})));

  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange=true)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,50})));
  HydraulicRam hydraulicRam(A=0.1, L=0.5)
    annotation (Placement(transformation(extent={{100,40},{120,60}})));

  inner Modelica.Mechanics.MultiBody.World world(
    n={0,0,-1},
    axisColor_x={0,180,0},
    axisColor_y={255,0,0},
    axisColor_z={0,0,255})
    annotation (Placement(transformation(extent={{-100,120},{-80,140}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation angleCAB1(
                                                            angle=70)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,130})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentCA1(
                                                            r={0.2,0,0})
    annotation (Placement(transformation(extent={{60,120},{80,140}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteA1(
                                                         n={0,1,0},
      useAxisFlange=false)
    annotation (Placement(transformation(extent={{-60,120},{-40,140}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentAB1(
                                                            r={0.35,0,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,90})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteB1(
                                                         n={0,1,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,50})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentBE1(
                                                            r={0.95,0,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,10})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentED1(
                                                            r={-0.3,0,0.5})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-70})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteD1(
                                                         n={0,1,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-110})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(r={1,0,0.5}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-150})));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute(n=
       {0,1,0}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-30})));
  Modelica.Fluid.Interfaces.FluidPort_a
                                      H1(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
                                         annotation (Placement(transformation(extent={{180,180},
            {200,200}})));
  Modelica.Fluid.Interfaces.FluidPort_b
                                      H2(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
                                         annotation (Placement(transformation(extent={{180,
            -180},{200,-160}})));
equation
  connect(prismatic.frame_b, fixed3.frame_b) annotation (Line(
      points={{70,40},{70,20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(angleCAB1.frame_b, segmentCA1.frame_a)
                                               annotation (Line(
      points={{40,130},{60,130}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteB1.frame_b, segmentBE1.frame_a)
                                                annotation (Line(
      points={{-10,40},{-10,20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteB1.frame_a, segmentAB1.frame_b)
                                                annotation (Line(
      points={{-10,60},{-10,80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentED1.frame_b, revoluteD1.frame_a)
                                                annotation (Line(
      points={{-10,-80},{-10,-100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteD1.frame_b, fixed1.frame_b)
                                             annotation (Line(
      points={{-10,-120},{-10,-140}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteA1.frame_b, segmentAB1.frame_a)
                                                annotation (Line(
      points={{-40,130},{-10,130},{-10,100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentED1.frame_a, revolute.frame_b)
                                               annotation (Line(
      points={{-10,-60},{-10,-40}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentBE1.frame_b, revolute.frame_a)
                                               annotation (Line(
      points={{-10,0},{-10,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(world.frame_b, revoluteA1.frame_a)
                                            annotation (Line(
      points={{-80,130},{-60,130}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentAB1.frame_a, angleCAB1.frame_a)
                                               annotation (Line(
      points={{-10,100},{-10,130},{20,130}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.frame_a, segmentCA1.frame_b) annotation (Line(
      points={{70,60},{70,90},{110,90},{110,130},{80,130}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic.support, hydraulicRam.M1) annotation (Line(
      points={{76,54},{88,54},{88,59},{101,59}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(prismatic.axis, hydraulicRam.M2) annotation (Line(
      points={{76,42},{88,42},{88,41},{101,41}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(hydraulicRam.H2, H2) annotation (Line(
      points={{119,41},{119,-170},{190,-170}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hydraulicRam.H1, H1) annotation (Line(
      points={{119,59},{120,59},{120,190},{190,190}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -180},{200,200}}),      graphics), Icon(coordinateSystem(extent={{
            -200,-180},{200,200}})));
end MecanicModule;
