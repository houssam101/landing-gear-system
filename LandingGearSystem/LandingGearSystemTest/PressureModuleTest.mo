within LandingGearSystem.LandingGearSystemTest;
model PressureModuleTest
  PressureModule pressureModule
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    m_flow_nominal=10,
    allowFlowReversal=false,
    dp_nominal=100000)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));

  Modelica.Blocks.Sources.BooleanPulse booleanStep(
    startTime=20,
    width=20,
    period=5) annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Fluid.Vessels.OpenTank tank(
    nPorts=1,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.01)},
    height=1,
    crossArea=1,
    level_start=0)
    annotation (Placement(transformation(extent={{10,22},{50,62}})));

  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
equation
  connect(pressureModule.ports_b, valveDiscrete.port_a) annotation (Line(
      points={{-59,10},{-40,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(booleanStep.y, valveDiscrete.open) annotation (Line(
      points={{-39,50},{-30,50},{-30,18}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(valveDiscrete.port_b, tank.ports[1]) annotation (Line(
      points={{-20,10},{30,10},{30,22}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end PressureModuleTest;
