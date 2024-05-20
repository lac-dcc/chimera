// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License


//andi_tb.v
`timescale 1ns/10ps
module andi_tb;
   // All variables (that are input to datapath) - must be reg
   reg  PCout, Zlowout, Zhighout, MDRout, R2out, R4out;           // add any other signals to see in your simulation
   reg  MARin, Zlowin, Zhighin, PCin, MDRin, IRin, Yin;
   reg  IncPC, Read, R5in, R2in, R4in, 	 
	 Gra,
	 Grb,
 	 Grc,
 	 Rin,
	 Rout,
	 BAout,
	 conInput,
	 IRout,
	 outPortEnable,
	 wren,
	 InPortout,
	 LOin, 
    LOout,
	 Cout;

reg  Clock, Clear;
   reg  [31:0] Mdatain;
    reg [3:0] ctrl;
   // States
   // Manji States: TX
   // Preparing: Reg_loadXX (put values in registers)
   // Default: Initialize (all values set to zero)
   // will need an extra state for mul/div
   parameter   Default = 4'b0000,
   Reg_load1a = 4'b0001,
   Reg_load1b = 4'b0010,
   Reg_load2a = 4'b0011,
   Reg_load2b = 4'b0100,
   Reg_load3a = 4'b0101,
   Reg_load3b = 4'b0110,
   T0 = 4'b0111,
   T1 = 4'b1000,
   T2 = 4'b1001,
   T3 = 4'b1010,
   T4 = 4'b1011,
   T5 = 4'b1100,
   T6 = 4'b1101,
	T7 = 4'b1111;
   reg   [4:0] Present_state = Default;
datapath DUT(.PCout(PCout), .Zlowout(Zlowout), .Zhighout(Zhighout), .MDRout(MDRout),.MARin(MARin), .Zlowin(Zlowin), .Zhighin(Zhighin), .PCin(PCin),
.MDRin(MDRin), .IRin(IRin), .Yin(Yin), .IncPC(IncPC), .Read(Read), .ctrl(ctrl), .Clock(Clock), .Clear(Clear), .Gra(Gra),
		.Grb(Grb),
		.Grc(Grc),
		.Rin(Rin),
		.Rout(Rout),
		.BAout(BAout),
		.conInput(conInput),
	   .IRout(IRout),
		.outPortEnable(outPortEnable),
		.wren(wren),
		.InPortout(InPortout),
		.LOin(LOin), 
      .LOout(LOout),
		.Cout(Cout)
		
);
initial
   begin
Clock = 0;
      forever #10 Clock = ~ Clock;
end
// changing between states
always @(posedge Clock)  // finite state machine; if clock rising-edge
  begin
     case (Present_state)
  Default   :  #40 Present_state = Reg_load1a; // 40 > 10 + 15
   Reg_load1a  :#40   Present_state = Reg_load1b;

 Reg_load1b  :#40   Present_state = Reg_load2a;
   Reg_load2a  :#40   Present_state = Reg_load2b;
   Reg_load2b  :#40   Present_state = Reg_load3a;
   Reg_load3a  :#40   Present_state = Reg_load3b;
   Reg_load3b  :#40   Present_state = T0;
   T0    :#40  Present_state = T1;
   T1    :#40  Present_state = T2;
   T2    :#40  Present_state = T3;
   T3    :#40  Present_state = T4;
   T4    :#40 Present_state = T5;
endcase end
always @(Present_state)  // do the required job in each state
 begin
   case (Present_state)
//cycle
   Default: begin
       PCout <= 0;
       Zlowout <= 0;
       MDRout <= 0;
       R2out <= 0;
       R4out <= 0;
       MARin <= 0;
       Zlowin <= 0;
       Zhighin <= 0;
       PCin <=0;
       MDRin <= 0;
       IRin  <= 0;
       Yin <= 0;
       IncPC <= 0;
         // assert the required signals in each clock
// initialize the signals
Read <= 0;
ctrl <= 0;
R5in <= 0;
R2in <= 0;
R4in <= 0;
Mdatain <= 32'h00000000;

      Clear <= 1;
   end
	/*
Reg_load1a: begin
     Mdatain <= 32'h00000022; // TODO generate hex code for each instruction
   #10 Read <= 1; MDRin <= 1;
   #15 Read <= 0; MDRin <= 0;
end
Reg_load1b: begin
   #10 MDRout <= 1; R2in <= 1;
   #15 MDRout <= 0; R2in <= 0;
end
Reg_load2a: begin
// initialize R2 with the value $22
   Mdatain <= 32'h00000024;  // value to be put in register
   #10 Read <= 1; MDRin <= 1;
   #15 Read <= 0; MDRin <= 0;
end
Reg_load2b: begin
   #10 MDRout <= 1; R4in <= 1;
   #15 MDRout <= 0; R4in <= 0;  // initialize R4 with the value $24
end
Reg_load3a: begin
   Mdatain <= 32'h00000026;
   #10 Read <= 1; MDRin <= 1;
   #15 Read <= 0; MDRin <= 0;
end
Reg_load3b: begin
   #10 MDRout <= 1; R5in <= 1;
   #15 MDRout <= 0; R5in <= 0;  // initialize R5 with the value $26
end
*/
T0: begin
       #10 PCout <= 1; MARin <= 1; IncPC <= 1; Zlowin <= 1;
       #15 PCout <= 0; MARin <= 0; IncPC <= 0; Zlowin <= 0;
end
T1: begin
      // Mdatain <= 32'h4A90000;
   #10 Zlowout <= 1;
       PCin <= 1;
       Read <= 1;
       MDRin <= 1;
		 
   #15 Zlowout <= 0;
// opcode
       PCin <= 0;
       Read <= 0;
       MDRin <= 0;
end
//t2 is step 9
T2: begin
       #10 MDRout <= 1; IRin <= 1;
       #15 MDRout <= 0; IRin <= 0;
end
//t3 is step 10
T3: begin
     #10 Grb <= 1; Rout <= 1; Yin <= 1;
     #15 Grb <= 0; Rout <= 0; Yin <= 0;
end
T4: begin
     #10 Cout <= 1; ctrl <= 0; Zlowin <= 1;
     #15 Cout <= 0; Zlowin <= 0;
end
T5: begin
     #10 Zlowout <= 1; Gra <= 1; Rin <= 1;
     #15 Zlowout <= 0; Gra <= 0; Rin <= 0;
end
endcase end
endmodule