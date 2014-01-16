within LandingGearSystem.LandingGearSystemTest;
model HydraulicModuleTest

  HydraulicModule hydraulicModule
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Sources.Constant PressureSetPoint(k=2e5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},  rotation=0,
        origin={-70,10})));
  inner Modelica.Mechanics.MultiBody.World world(
    n={0,0,-1},
    axisColor_x={0,180,0},
    axisColor_y={255,0,0},
    axisColor_z={0,0,255})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,90})));

  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
equation
  connect(PressureSetPoint.y, hydraulicModule.u) annotation (Line(
      points={{-59,10},{-42,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HydraulicModuleTest;
