within LandingGearSystem.LandingGearSystemTest;
model BidirectionalRamTest
  BidirectionalRam bidirectionalRam(
    A=0.1,
    L=10,
    rho=1000) annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  PressureModule pressureModule
    annotation (Placement(transformation(extent={{-68,0},{-48,20}})));
equation
  connect(pressureModule.ports_b, bidirectionalRam.retract) annotation (Line(
      points={{-47,10},{-21,10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pressureModule.ports_a, bidirectionalRam.extend) annotation (Line(
      points={{-69,10},{-80,10},{-80,40},{10,40},{10,10},{1,10}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end BidirectionalRamTest;
