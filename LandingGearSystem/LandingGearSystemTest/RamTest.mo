within LandingGearSystem.LandingGearSystemTest;
model RamTest

  Modelica.Fluid.Vessels.OpenTank tank1(
    crossArea=6,
    height=4,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
          diameter=0.2,
          height=4,
          zeta_out=0,
          zeta_in=1),Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(
          diameter=0.2,
          height=0,
          zeta_out=0,
          zeta_in=1)},
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    level_start=0.5,
    nPorts=1)             annotation (Placement(transformation(extent={{20,20},
            {60,60}},      rotation=0)));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Fluid.Machines.SweptVolume sweptVolume(
    nPorts=1,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    pistonCrossArea=0.05,
    clearance=0.01,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.01)})
    annotation (Placement(transformation(extent={{-40,-4},{-20,16}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=1, L=0.2) annotation
    (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,50})));
  Modelica.Mechanics.Translational.Components.Spring spring(c=10, s_rel0=1)
    annotation (Placement(transformation(extent={{-20,80},{0,100}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{20,80},{40,100}})));
equation
  connect(tank1.ports[1], sweptVolume.ports[1]) annotation (Line(
      points={{40,20},{6,20},{6,-4},{-30,-4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(mass.flange_a, sweptVolume.flange) annotation (Line(
      points={{-30,40},{-30,16}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(mass.flange_b, spring.flange_a) annotation (Line(
      points={{-30,60},{-30,90},{-20,90}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(spring.flange_b, fixed.flange) annotation (Line(
      points={{0,90},{30,90}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end RamTest;
