within LandingGearSystem.LandingGearSystemTest;
model DriverModuleTest
  DriverModule driverModule(startL=0.5, gain=10000)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Sources.Ramp step(startTime=5,
    duration=10,
    height=0.5,
    offset=0.5)
    annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
  Modelica.Mechanics.Translational.Components.Spring spring(s_rel0=0.5, c=1000)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,0})));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Modelica.Blocks.Continuous.LimPID PID(controllerType=Modelica.Blocks.Types.SimpleController.P,
      k=100) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,-40})));
equation
  connect(PID.u_s, step.y) annotation (Line(
      points={{-52,0},{-75,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(positionSensor.s, PID.u_m) annotation (Line(
      points={{-11,-40},{-40,-40},{-40,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fixed.flange, spring.flange_a) annotation (Line(
      points={{90,-10},{90,-6.66134e-16},{70,-6.66134e-16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(driverModule.flange_a, positionSensor.flange) annotation (Line(
      points={{21,0},{36,0},{36,-40},{10,-40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(spring.flange_b, positionSensor.flange) annotation (Line(
      points={{50,0},{36,0},{36,-40},{10,-40}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(PID.y, driverModule.speed) annotation (Line(
      points={{-29,0},{-2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end DriverModuleTest;
