within LandingGearSystem;
model HydraulicRam

  parameter Modelica.SIunits.Area A;
  parameter Modelica.SIunits.Length L;

  Modelica.Fluid.Interfaces.FluidPort H1 annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Fluid.Interfaces.FluidPort H2 annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Modelica.Mechanics.Translational.Interfaces.Support M1 annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Mechanics.Translational.Interfaces.Support M2 annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));

equation
  (H1.p - H2.p) * A - (M1.f - M2.f) = 0;

  if (M1.s - M2.s) < L then
    der(M1.s - M2.s) = (H1.p*A)/H1.m_flow;
  else
    der(M1.s - M2.s) = 0;
  end if;

  H1.m_flow + H2.m_flow = 0;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-30,92},{30,-92}}, lineColor={0,0,255}),
        Rectangle(extent={{-28,14},{28,4}}, lineColor={0,0,255}),
        Rectangle(extent={{-4,14},{4,106}}, lineColor={0,0,255})}));

end HydraulicRam;
