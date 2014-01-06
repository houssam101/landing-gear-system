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
  Modelica.StateGraph.InitialStep Open
    annotation (Placement(transformation(extent={{-78,-52},{-58,-32}})));
  Modelica.StateGraph.Transition transition(condition=voter.voter_output <>
        previous(voter.voter_output), waitTime=0.8)
    annotation (Placement(transformation(extent={{-46,-52},{-26,-32}})));
  Modelica.StateGraph.StepWithSignal
                           Intermediate1
    annotation (Placement(transformation(extent={{-10,-52},{10,-32}})));
equation

  when Clock(0.4) then

    timer = previous(timer) - 1;

  end when;

  connect(handle, voter.voter_input) annotation (Line(
      points={{4.44089e-16,110},{4.44089e-16,101},{0,101},{0,87}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Open.outPort[1], transition.inPort) annotation (Line(
      points={{-57.5,-42},{-40,-42}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(transition.outPort, Intermediate1.inPort[1]) annotation (Line(
      points={{-34.5,-42},{-11,-42}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end AnalogicalSwitch;
