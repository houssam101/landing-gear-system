within LandingGearSystem;
model Voter

  TriplicatedDigitalInput voter_input annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,110})));
  DigitalOutput voter_output annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-110})));

  Boolean comb_12(start=false);
  Boolean comb_23(start=false);
  Boolean comb_13(start=false);

equation
  comb_12 = voter_input.val1 and voter_input.val2;
  comb_23 = voter_input.val2 and voter_input.val3;
  comb_13 = voter_input.val1 and voter_input.val3;

  voter_output = comb_12 or comb_23 or comb_13;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
          extent={{-100,60},{100,-60}},
          lineColor={125,125,125},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,60},{100,-60}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="VOTER")}));
end Voter;
