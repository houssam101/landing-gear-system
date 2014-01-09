within LandingGearSystem;
model AnalogicalSwitch
  "Protect the system against abnormal behavior of the digital part."

  type State = enumeration(
      OPEN,
      CLOSED,
      INTERMEDIATE1,
      INTERMEDIATE2);

  TriplicatedDigitalInput handle annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,110})));
  TriplicatedDigitalOutput state annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  DigitalInput switch_input annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  DigitalOutput switch_output annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,0})));

  State internal_state(start=State.CLOSED);
  Integer timer(start=0);

  Voter voter annotation (Placement(transformation(extent={{-10,66},{10,86}})));
  Modelica.StateGraph.InitialStepWithSignal
                                  Open
    annotation (Placement(transformation(extent={{-10,16},{10,36}})));
  Modelica.StateGraph.Transition transition(condition=voter.voter_output <>
        previous(voter.voter_output), waitTime=0.8)
    annotation (Placement(transformation(extent={{20,16},{40,36}})));
  Modelica.StateGraph.StepWithSignal
                           Intermediate1
    annotation (Placement(transformation(extent={{62,-10},{82,10}})));
  Modelica.StateGraph.Alternative alternative
    annotation (Placement(transformation(extent={{-52,-52},{52,52}})));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Modelica.StateGraph.Transition transition1
    annotation (Placement(transformation(extent={{-40,16},{-20,36}})));
  Modelica.StateGraph.Transition transition2
    annotation (Placement(transformation(extent={{-10,-36},{10,-16}})));
  Modelica.StateGraph.StepWithSignal Closed annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={30,-70})));
  Modelica.StateGraph.Transition transition3
    annotation (Placement(transformation(extent={{70,-80},{50,-60}})));
  Modelica.StateGraph.StepWithSignal
                           Intermediate2
    annotation (Placement(transformation(extent={{-20,-80},{-40,-60}})));
  Modelica.StateGraph.Transition transition4
    annotation (Placement(transformation(extent={{10,-80},{-10,-60}})));
equation

  when Clock(0.4) then
    timer = previous(timer) - 1;
  end when;

  when Closed.active then
    // TODO
    //timer =
  end when;

  connect(handle, voter.voter_input) annotation (Line(
      points={{4.44089e-16,110},{4.44089e-16,101},{0,101},{0,87}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(alternative.split[1], transition2.inPort) annotation (Line(
      points={{-41.08,26},{-41.08,-26},{-4,-26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transition1.inPort, alternative.split[1]) annotation (Line(
      points={{-34,26},{-41.08,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(alternative.join[1], transition2.outPort) annotation (Line(
      points={{41.08,26},{41.08,-26},{1.5,-26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Open.inPort[1], transition1.outPort) annotation (Line(
      points={{-11,26},{-28.5,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transition.inPort, Open.outPort[1]) annotation (Line(
      points={{26,26},{10.5,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transition.outPort, alternative.join[1]) annotation (Line(
      points={{31.5,26},{41.08,26}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(alternative.outPort, Intermediate1.inPort[1]) annotation (Line(
      points={{53.04,0},{61,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transition3.inPort, Intermediate1.outPort[1]) annotation (Line(
      points={{64,-70},{90,-70},{90,4.44089e-16},{82.5,4.44089e-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transition3.outPort, Closed.inPort[1]) annotation (Line(
      points={{58.5,-70},{41,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transition4.inPort, Closed.outPort[1]) annotation (Line(
      points={{4,-70},{19.5,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Intermediate2.inPort[1], transition4.outPort) annotation (Line(
      points={{-19,-70},{-1.5,-70}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Intermediate2.outPort[1], alternative.inPort) annotation (Line(
      points={{-40.5,-70},{-70,-70},{-70,1.77636e-15},{-53.56,1.77636e-15}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end AnalogicalSwitch;
