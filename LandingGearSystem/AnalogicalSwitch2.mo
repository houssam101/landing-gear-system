within LandingGearSystem;
model AnalogicalSwitch2

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

  inner Integer timer(start=0);
  inner State internal_state(start=State.OPEN);

  block Open
    outer output Integer timer;
    outer output State internal_state;
    annotation (
      Icon(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%name")}),
      Diagram(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%stateName",
            fontSize=10)}),
      __Dymola_state=true,
      showDiagram=true,
      singleInstance=true);
  equation
    //internal_state = State.OPEN;
    internal_state = previous(internal_state);
    timer = previous(timer) - 1;
  end Open;

  Open open annotation (Placement(transformation(extent={{-78,-74},{-22,-22}})));

  block Closed
    outer output Integer timer;
    outer output State internal_state;
    annotation (
      Icon(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%name")}),
      Diagram(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%stateName",
            fontSize=10)}),
      __Dymola_state=true,
      showDiagram=true,
      singleInstance=true);
  equation
    internal_state = State.CLOSED;
  end Closed;

  Closed closed annotation (Placement(transformation(extent={{22,22},{78,78}})));

  block Intermediate1
    outer output Integer timer;
    outer output State internal_state;
    annotation (
      Icon(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%name")}),
      Diagram(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%stateName",
            fontSize=10)}),
      __Dymola_state=true,
      showDiagram=true,
      singleInstance=true);
  equation
    internal_state = State.INTERMEDIATE1;
  end Intermediate1;
  Intermediate1 intermediate1
    annotation (Placement(transformation(extent={{-78,22},{-22,78}})));

  block Intermediate2
    outer output Integer timer;
    outer output State internal_state;
    annotation (
      Icon(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%name")}),
      Diagram(graphics={Text(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            textString="%stateName",
            fontSize=10)}),
      __Dymola_state=true,
      showDiagram=true,
      singleInstance=true);
  equation
    internal_state = State.INTERMEDIATE2;
  end Intermediate2;
  Intermediate2 intermediate2
    annotation (Placement(transformation(extent={{22,-78},{78,-22}})));

  Voter handle_voter;

equation
  // Timer decreasing.
  //if previous(timer) > 0 then
  //  timer = previous(timer) - 1;
  //else

//  timer = previous(timer);
 // end if;

  // Handle voter.
  connect(handle, handle_voter.voter_input);

  // State machine.
  /*
  if open.active then
    internal_state = State.OPEN;
  elseif closed.active then
    internal_state = State.CLOSED;
  elseif intermediate1.active then
    internal_state = State.INTERMEDIATE1;
  elseif intermediate2.active then
    internal_state = State.INTERMEDIATE2;
  else
    internal_state = State.UNDEFINED;
  end if;
  */

  initialState(open);

  transition(
    closed,
    closed,
    handle_voter.voter_output <> previous(handle_voter.voter_output),
    immediate=false,
    synchronize=false)
    annotation (
     Line(
      points={{40,80},{40,90},{60,90},{60,80}},
      color={175,175,175},
      thickness=0.25,
      smooth=Smooth.Bezier), Text(
      string="handle?",
      extent={{4,4},{4,10}},
      lineColor={95,95,95},
      fontSize=10,
      textStyle={TextStyle.Bold},
      horizontalAlignment=TextAlignment.Left));

  transition(
    open,
    intermediate1,
    handle_voter.voter_output <> previous(handle_voter.voter_output),
    immediate=false)
    annotation (Line(
      points={{-50,-20},{-50,20}},
      color={175,175,175},
      thickness=0.25,
      smooth=Smooth.Bezier), Text(
      string="handle?",
      extent={{4,-4},{4,-10}},
      lineColor={95,95,95},
      fontSize=10,
      textStyle={TextStyle.Bold},
      horizontalAlignment=TextAlignment.Left));

  transition(
    intermediate1,
    closed,
    timer == 0,
    immediate=false,
    priority=1) annotation (Line(
      points={{-20,50},{20,50}},
      color={175,175,175},
      thickness=0.25,
      smooth=Smooth.Bezier), Text(
      string="%condition",
      extent={{-4,4},{-4,10}},
      lineColor={95,95,95},
      fontSize=10,
      textStyle={TextStyle.Bold},
      horizontalAlignment=TextAlignment.Right));

  transition(
    closed,
    intermediate2,
    timer == 0,
    priority=2,
    immediate=false)     annotation (Line(
      points={{50,20},{50,-20}},
      color={175,175,175},
      thickness=0.25,
      smooth=Smooth.Bezier), Text(
      string="%condition",
      extent={{-4,4},{-4,10}},
      lineColor={95,95,95},
      fontSize=10,
      textStyle={TextStyle.Bold},
      horizontalAlignment=TextAlignment.Right));

  transition(
    intermediate2,
    open,
    timer == 0,
    immediate=false,
    priority=2) annotation (Line(
      points={{20,-52},{-20,-52}},
      color={175,175,175},
      thickness=0.25,
      smooth=Smooth.Bezier), Text(
      string="%condition",
      extent={{4,4},{4,10}},
      lineColor={95,95,95},
      fontSize=10,
      textStyle={TextStyle.Bold},
      horizontalAlignment=TextAlignment.Left));

  transition(
    intermediate2,
    intermediate1,
    handle_voter.voter_output <> previous(handle_voter.voter_output),
    priority=1,
    immediate=false)     annotation (Line(
      points={{21,-21},{-21,21}},
      color={175,175,175},
      thickness=0.25,
      smooth=Smooth.Bezier), Text(
      string="handle?",
      extent={{4,4},{4,10}},
      lineColor={95,95,95},
      fontSize=10,
      textStyle={TextStyle.Bold},
      horizontalAlignment=TextAlignment.Left));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end AnalogicalSwitch2;
