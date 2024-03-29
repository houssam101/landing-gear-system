within LandingGearSystem;
model MecanicModule

parameter Real P_coeff(start=100);

  inner Modelica.Mechanics.MultiBody.World world(
    n={0,0,-1},
    axisColor_x={0,180,0},
    axisColor_y={255,0,0},
    axisColor_z={0,0,255})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-170,130})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteA1(
                                                         n={0,1,0},
      useAxisFlange=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-170,90})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentAB1(diameter=0.1, r={
        0.25,0,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-170,50})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed2(r={0.25,0,1})  annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,130})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revoluteB2(
                                                         n={0,1,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,90})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentAB3(diameter=0.1, r={0,0,-0.375})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,50})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n={0,0,-1},
      useAxisFlange=true,
    s(start=0.25))                                         annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,10})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentAB4(diameter=0.1, r={0,0,-0.375})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,-30})));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint
                                               revoluteA2(
                                                         n={0,1,0})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-120,-70})));

  Modelica.Mechanics.Translational.Sensors.RelPositionSensor relPositionSensor
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-10,10})));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m=1)  annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-170,-150})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder segmentAB5(
    innerDiameter=0,
    diameter=0.1,
    r={2.5,0,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-170,-110})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,210})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_b annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,-190})));
equation
  connect(revoluteA1.frame_b, segmentAB1.frame_a)
                                                annotation (Line(
      points={{-170,80},{-170,60}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(world.frame_b, revoluteA1.frame_a)
                                            annotation (Line(
      points={{-170,120},{-170,100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fixed2.frame_b, revoluteB2.frame_a) annotation (Line(
      points={{-70,120},{-70,100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentAB3.frame_b, prismatic1.frame_a) annotation (Line(
      points={{-70,40},{-70,20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic1.frame_b, segmentAB4.frame_a) annotation (Line(
      points={{-70,0},{-70,-20}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentAB3.frame_a, revoluteB2.frame_b) annotation (Line(
      points={{-70,60},{-70,80}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentAB4.frame_b, revoluteA2.frame_b) annotation (Line(
      points={{-70,-40},{-70,-70},{-110,-70}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(prismatic1.support, relPositionSensor.flange_a) annotation (Line(
      points={{-64,14},{-50,14},{-50,30},{-10,30},{-10,20}},
      color={0,127,0},
      smooth=Smooth.None));

  connect(pointMass.frame_a, segmentAB5.frame_b) annotation (Line(
      points={{-170,-150},{-170,-120}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(segmentAB1.frame_b, segmentAB5.frame_a) annotation (Line(
      points={{-170,40},{-170,-100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(revoluteA2.frame_a, segmentAB5.frame_a) annotation (Line(
      points={{-130,-70},{-170,-70},{-170,-100}},
      color={95,95,95},
      thickness=0.5,
      smooth=Smooth.None));
  connect(relPositionSensor.s_rel, y) annotation (Line(
      points={{1,10},{30,10},{30,90},{4.44089e-16,90},{4.44089e-16,210}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prismatic1.axis, flange_b) annotation (Line(
      points={{-64,2},{-40,2},{-40,-20},{4.44089e-16,-20},{4.44089e-16,-190}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(relPositionSensor.flange_b, flange_b) annotation (Line(
      points={{-10,-4.44089e-16},{-10,-20},{0,-20},{0,-190},{4.44089e-16,-190}},
      color={0,127,0},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -180},{200,200}}),      graphics), Icon(coordinateSystem(extent={{
            -200,-180},{200,200}})));
end MecanicModule;
