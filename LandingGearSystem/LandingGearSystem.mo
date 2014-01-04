within LandingGearSystem;
model LandingGearSystem
  Modelica.Fluid.Sources.FixedBoundary AircraftHydraulicCircuit(nPorts=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={90,30})));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={50,30})));
  DigitalArchitecture digitalArchitecture
    annotation (Placement(transformation(extent={{-80,48},{-48,80}})));
equation
  connect(AircraftHydraulicCircuit.ports[1], valveDiscrete.port_a) annotation (
      Line(
      points={{80,30},{60,30}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end LandingGearSystem;
