within LandingGearSystem;
model WormDrive

  parameter Real step;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a rotation
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));

  Modelica.Mechanics.Translational.Interfaces.Flange_a translation
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

equation
  translation.s = step * rotation.phi;
  rotation.tau + step * translation.f = 0;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,4},{100,-4}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}),
        Line(
          points={{-94,10},{-86,-10},{-78,10},{-72,-10},{-64,10},{-58,-10},{-52,
              10},{-46,-10},{-40,10},{-34,-10},{-28,10},{-22,-10},{-16,10},{-10,
              -10},{-4,10},{2,-10},{8,10},{14,-10},{20,10},{26,-10},{32,10},{38,
              -10},{44,10},{50,-10},{56,10},{62,-10},{68,10},{74,-10},{80,10},{86,
              -10}},
          color={0,0,255},
          smooth=Smooth.None),
        Rectangle(
          extent={{0,30},{20,-30}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{10,30},{10,50},{110,50},{110,10},{110,10}},
          color={0,0,255},
          smooth=Smooth.None)}));
end WormDrive;
