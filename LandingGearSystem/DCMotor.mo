within LandingGearSystem;
model DCMotor

  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-66,-56},{-46,-36}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=-90,
        origin={-68,0})));
  Modelica.Blocks.Interfaces.RealInput v
    "Voltage between pin p and n (= p.v - n.v) as input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange(phi(start=0))
    "Right flange of shaft"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet
                                                       dcpm(
    VaNominal=200,
    IaNominal=40,
    wNominal=1047.1975511966)
    annotation (Placement(transformation(extent={{42,-10},{62,10}},
          rotation=0)));
equation
  connect(signalVoltage.p, ground.p) annotation (Line(
      points={{-68,-10},{-68,-36},{-56,-36}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(v, signalVoltage.v) annotation (Line(
      points={{-120,1.11022e-15},{-98,1.11022e-15},{-98,0},{-75,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(signalVoltage.n, dcpm.pin_an) annotation (Line(
      points={{-68,10},{-68,50},{46,50},{46,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(ground.p, dcpm.pin_ap) annotation (Line(
      points={{-56,-36},{74,-36},{74,20},{58,20},{58,10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(dcpm.flange, flange) annotation (Line(
      points={{62,0},{110,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-90,56},{32,-50}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,0,0}),
        Polygon(
          points={{-98,-90},{-88,-90},{-58,-20},{-8,-20},{22,-90},{32,-90},{32,
              -100},{-98,-100},{-98,-90}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{32,10},{92,-10}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192})}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end DCMotor;
