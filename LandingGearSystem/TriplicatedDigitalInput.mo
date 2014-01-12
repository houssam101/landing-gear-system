within LandingGearSystem;
connector TriplicatedDigitalInput "Triplicated Digital Input."

  input Boolean val1(start=false) "true, if activated." annotation (HideResult=true);
  input Boolean val2(start=false) "true, if activated." annotation (HideResult=true);
  input Boolean val3(start=false) "true, if activated." annotation (HideResult=true);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),       graphics={Polygon(
          points={{-60,80},{-60,-80},{80,0},{-60,80}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255}), Text(
          extent={{-100,100},{-640,140}},
          lineColor={0,0,255},
          textString="%name",
          textStyle={TextStyle.Italic})}));
end TriplicatedDigitalInput;
