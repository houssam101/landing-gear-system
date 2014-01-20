within LandingGearSystem.LandingGearSystemTest;
model TranslationInverterTest
  TranslationInverter translationInverter annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={20,0})));
  Modelica.Mechanics.Translational.Sources.Position position
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Sources.Ramp ramp(duration=0.5, startTime=0.25)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Mechanics.Translational.Components.Mass mass
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  connect(ramp.y, position.s_ref) annotation (Line(
      points={{-49,0},{-32,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(position.flange, translationInverter.flange_a) annotation (Line(
      points={{-10,0},{9,0}},
      color={0,127,0},
      smooth=Smooth.None));
  connect(translationInverter.flange_b, mass.flange_a) annotation (Line(
      points={{31,0},{50,0}},
      color={0,127,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end TranslationInverterTest;
