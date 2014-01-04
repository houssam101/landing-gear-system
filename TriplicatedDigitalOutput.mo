within LandingGearSystem;
connector TriplicatedDigitalOutput "Triplicated Digital Output."

  output Boolean val1 "true, if activated." annotation (HideResult=true);
  output Boolean val2 "true, if activated." annotation (HideResult=true);
  output Boolean val3 "true, if activated." annotation (HideResult=true);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),       graphics={Polygon(
          points={{60,80},{60,-80},{-80,0},{60,80}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}), Text(
          extent={{-100,100},{-640,140}},
          lineColor={0,0,255},
          textString="%name",
          textStyle={TextStyle.Italic})}));

end TriplicatedDigitalOutput;
