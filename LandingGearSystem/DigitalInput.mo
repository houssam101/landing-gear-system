within LandingGearSystem;
connector DigitalInput =
  input Boolean "true, if step is active"
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
          {100,100}}),   graphics={Polygon(
          points={{-60,80},{-60,-80},{80,0},{-60,80}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          smooth=Smooth.None,
          fillColor={125,125,125}), Text(
        extent={{-100,100},{-640,140}},
        lineColor={0,0,255},
        textString="%name",
        textStyle={TextStyle.Italic})}));
