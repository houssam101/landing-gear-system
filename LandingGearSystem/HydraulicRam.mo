within LandingGearSystem;
model HydraulicRam

  parameter Modelica.SIunits.Area area;
  parameter Modelica.SIunits.Density fluid_density;

  Modelica.Fluid.Interfaces.FluidPorts_a ports_a(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{100,-40},{120,40}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a(s(start=0))
    annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b(s(start=0))
    annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));

equation
  flange_a.f + flange_b.f = area * ports_a.p;

  der(flange_b.s) = ports_a.m_flow/(area*fluid_density);
  der(flange_a.s) = 0;

  ports_a.h_outflow = 0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Rectangle(
          extent={{-44,72},{-40,-76}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Rectangle(
          extent={{40,72},{44,-76}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Rectangle(
          extent={{-38,50},{38,42}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-4,50},{4,96}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-44,-76},{44,-72}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{100,0},{72,0},{70,0},{70,-90},{30,-90},{30,-78},{30,-76},{30,
              -74}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-100,-90},{-30,-90},{-30,-76},{-30,-76}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-100,90},{-2,90},{-2,90}},
          color={0,0,255},
          smooth=Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end HydraulicRam;
