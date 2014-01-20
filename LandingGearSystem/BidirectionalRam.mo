within LandingGearSystem;
model BidirectionalRam

  Modelica.SIunits.Volume V_left(start=0);
  Modelica.SIunits.Volume V_right;
  parameter Modelica.SIunits.Area A;
  parameter Modelica.SIunits.Length L;
  parameter Modelica.SIunits.Density rho;

  Modelica.Fluid.Interfaces.FluidPort_a  retract(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a  extend(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{-10,100},{10,120}})));

equation
  V_right = A*L - V_left;

  der(V_left) = retract.m_flow/rho;
  extend.m_flow + retract.m_flow = 0;
  extend.h_outflow + retract.h_outflow = 0;

  flange.s = V_right/A;
  flange.f = (extend.p-retract.p)*A;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end BidirectionalRam;
