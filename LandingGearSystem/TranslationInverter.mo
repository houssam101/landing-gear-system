within LandingGearSystem;
model TranslationInverter

  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
equation

  flange_a.f + flange_b.f = 0;
  der(flange_a.s) + der(flange_b.s) = 0;

end TranslationInverter;
