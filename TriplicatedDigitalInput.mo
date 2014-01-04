within LandingGearSystem;
connector TriplicatedDigitalInput "Triplicated Digital Input."

  output Boolean occupied1 "true, if step1 is active" annotation (HideResult=true);
  output Boolean occupied2 "true, if step2 is active" annotation (HideResult=true);
  output Boolean occupied3 "true, if step3 is active" annotation (HideResult=true);

  input Boolean set1;
  input Boolean set2;
  input Boolean set3;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Polygon(
          points={{-60,80},{-60,-80},{80,0},{-60,80}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,255})}));
end TriplicatedDigitalInput;
