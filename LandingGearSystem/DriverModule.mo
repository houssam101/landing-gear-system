within LandingGearSystem;
model DriverModule

  parameter Modelica.SIunits.Length startL(start=0.25);
  parameter Real gain(start=100);

  DCMotor dCMotor
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  WormDrive wormDrive(step=0.003)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.1)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=10)
    annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    Ti=1000,
    Td=0.001,
    k=2,
    yMax=200,
    yMin=-200)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-64,-40})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,-20})));
  Modelica.Blocks.Interfaces.RealInput speed
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Mechanics.Translational.Components.Rod rod(L=startL)
    annotation (Placement(transformation(extent={{72,-10},{92,10}})));
  Modelica.Blocks.Math.Gain multiplier(k=gain)
    annotation (Placement(transformation(extent={{-92,-80},{-72,-60}})));
equation
  connect(idealGear.flange_b,inertia. flange_a) annotation (Line(
      points={{-8,4.44089e-16},{10,4.44089e-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(dCMotor.flange,idealGear. flange_a) annotation (Line(
      points={{-37,0},{-32,0},{-32,4.44089e-16},{-28,4.44089e-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.flange,inertia. flange_a) annotation (Line(
      points={{-2,-10},{-2,4.44089e-16},{10,4.44089e-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.w, PID.u_m) annotation (Line(
      points={{-2,-31},{-2,-40},{-52,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(inertia.flange_b, wormDrive.rotation) annotation (Line(
      points={{30,0},{39,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(wormDrive.translation, rod.flange_a) annotation (Line(
      points={{61,4.44089e-16},{65.5,4.44089e-16},{65.5,0},{72,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(rod.flange_b, flange_a) annotation (Line(
      points={{92,0},{110,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(PID.y, dCMotor.v) annotation (Line(
      points={{-64,-29},{-64,0},{-60,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplier.y, PID.u_s)
                           annotation (Line(
      points={{-71,-70},{-64,-70},{-64,-52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiplier.u, speed)
                         annotation (Line(
      points={{-94,-70},{-120,-70},{-120,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end DriverModule;
