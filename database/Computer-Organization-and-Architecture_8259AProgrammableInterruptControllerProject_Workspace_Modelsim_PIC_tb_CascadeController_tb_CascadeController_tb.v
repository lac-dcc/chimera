// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module CascadeController_tb;

  // Inputs
  reg SP_master,SP_slave1,SP_slave2;
  reg [7:0] ICW3_slave1,ICW3_slave2;
  reg control_signal_master;
  reg [2:0] desired_slave_master;
  reg EOI_master;
  reg flag_ACK_slave1,flag_ACK_slave2;


  // Outputs and inouts
  wire [2:0] CAS;
  wire flag_slave1,flag_slave2;
  wire control_signal_ack_master;
// Instantiation of the CascadeController module for master
CascadeController master (
  .CAS(CAS),
  .SP(SP_master),
  .control_signal(control_signal_master),
  .desired_slave(desired_slave_master),
  .control_signal_ack(control_signal_ack_master),
  .EOI(EOI_master)
);
// Instantiation of the CascadeController module for first slave
CascadeController slave1 (
  .CAS(CAS),
  .SP(SP_slave1),
  .ICW3(ICW3_slave1),
  .flag(flag_slave1),
  .flag_ACK(flag_ACK_slave1)
);
// Instantiation of the CascadeController module for second slave
CascadeController slave2 (
  .CAS(CAS),
  .SP(SP_slave2),
  .ICW3(ICW3_slave2),
  .flag(flag_slave2),
  .flag_ACK(flag_ACK_slave2)
);

initial begin
  // Initialize inputs
  // at first the cascade wont equal slave1 or slave2 so flag of slave 1 and flag of slave 2 should be reset
  SP_master=1;
  SP_slave1=0;
  SP_slave2=0;
  control_signal_master=0;
  desired_slave_master=3'b111;
  ICW3_slave1=8'b00000110;
  ICW3_slave2=8'b00000101;

  #10 control_signal_master=1;
  //EOI signal came from master to cascade lines should be set to 3'bzzz
  #10 control_signal_master=0;
      EOI_master=1'b1;
      desired_slave_master=3'b110;
  // Cascade lines value should change to be equal to slave1 so flag of slave 1 should be set
  #10 control_signal_master=1;
      EOI_master=1'b0;
  //Flag acknowledge came to slave1 so flag1 should be reset
  #10 control_signal_master=0;
      EOI_master=1'b1;
      flag_ACK_slave1=1'b1;
      desired_slave_master=3'b101;
  // Cascade lines value should change to be equal to slave2 so flag of slave 2 should be set
  #10 control_signal_master=1;
      EOI_master=1'b0;
  #10 control_signal_master=0;
      EOI_master=1'b1;
      flag_ACK_slave2=1'b0;
  // Test in case that the desired slave by master didnt change for two interrupt in a row 
  // Flag of slave 2 should be reset and set again so its control logic is flagged slave2 sends its vector
  #10 control_signal_master=1;
    EOI_master=1'b0;
end

endmodule
