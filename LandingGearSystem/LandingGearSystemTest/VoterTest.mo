within LandingGearSystem.LandingGearSystemTest;
model VoterTest

  Voter voter1;
  Voter voter2;

equation
  voter1.voter_input.val1 = true;
  voter1.voter_input.val2 = true;
  voter1.voter_input.val3 = false;

  voter2.voter_input.val1 = false;
  voter2.voter_input.val2 = false;
  voter2.voter_input.val3 = true;

end VoterTest;
