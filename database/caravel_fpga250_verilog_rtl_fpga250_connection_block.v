// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module connection_block
  #(
    parameter WS = 8,
    parameter WD= 8, // WD must be multiple of 2
    parameter WG = 3,
    parameter CLBIN = 6,
    parameter CLBIN0 = 6,
    parameter CLBIN1 = 6,
    parameter CLBOUT = 1,
    parameter CLBOUT0 = 1,
    parameter CLBOUT1 = 1,
    parameter CARRY = 1,
    parameter CLBOS = 2,
    parameter CLBOS_BIAS = 0,
    parameter CLBOD = 2,
    parameter CLBOD_BIAS = 0,
    parameter CLBX = 1, // toggle using direct connections between CLBs or not
    parameter SWITCH_PER_IN0 = WS + WD + WG + CLBX * CLBOUT1,
    parameter SWITCH_PER_IN1 = WS + WD + WG + CLBX * CLBOUT0,
    parameter SWITCH_PER_OUT = CLBOS + CLBOD,
    parameter CLBOS_BIAS_WIDTH = (CLBOS_BIAS * CLBOS * (CLBOUT0 + CLBOUT1)) % WS,
    parameter CLBOD_BIAS_WIDTH = (CLBOD_BIAS * CLBOD * (CLBOUT0 + CLBOUT1)) % (WD/2)
    ) 
   (
    inout [WS-1:0]     single0, single1,
    inout [WD-1:0]     double0, double1,
    input [WG-1:0]     global,
    input [CLBOUT-1:0] clb0_output,
    input [CLBOUT-1:0] clb1_output,
    input [CARRY-1:0]  clb0_cout,
    input [CARRY-1:0]  clb1_cout,
    output [CLBIN-1:0] clb0_input,
    output [CLBIN-1:0] clb1_input,
    output [CARRY-1:0] clb0_cin,
    output [CARRY-1:0] clb1_cin,
    input [CLBIN0*SWITCH_PER_IN0
	   +CLBOUT0*SWITCH_PER_OUT
	   +CLBIN1*SWITCH_PER_IN1
	   +CLBOUT1*SWITCH_PER_OUT
	   -1:0] 	       c
    );
   
   
   genvar 		       i, j;
   
//   generate
//      for(i = 0; i < WS; i = i + 1) begin : single_wires
//	      assign single0[i] = single1[i];
//      end
//      for(i = 0; i < WD; i = i + 1) begin : double_wires
//	      assign double0[i] = double1[i];
//      end
//   endgenerate
   
   generate
      for(i = 0; i < CLBIN0; i = i + 1) begin : clb0_inputs
	 for(j = 0; j < WS; j = j + 1) begin : singles
	    transmission_gate_oneway s(clb0_input[i], single0[j], c[j+i*SWITCH_PER_IN0]);
	 end
	 for(j = 0; j < WD; j = j + 1) begin : doubles
	    transmission_gate_oneway s(clb0_input[i], double0[j], c[j+WS+i*SWITCH_PER_IN0]);
	 end
	 for(j = 0; j < WG; j = j + 1) begin : globals
	    transmission_gate_oneway s(clb0_input[i], global[j], c[j+WS+WD+i*SWITCH_PER_IN0]);
	 end
	 if(CLBX) begin
	    for(j = 0; j < CLBOUT1; j = j + 1) begin : directs
	       transmission_gate_oneway s(clb0_input[i], clb1_output[j], c[j+WS+WD+WG+i*SWITCH_PER_IN0]);
	    end
	 end
      end
      for(i = 0; i < CLBOUT0; i = i + 1) begin : clb0_outputs
	 for(j = 0; j < WS; j = j + 1) begin : singles
	    if((j + WS-(i*CLBOS)%WS + WS-CLBOS_BIAS_WIDTH) % WS < CLBOS) begin
	       transmission_gate_oneway s(single0[j], clb0_output[i], c[(j+WS-(i*CLBOS)%WS+WS-CLBOS_BIAS_WIDTH)%WS+i*SWITCH_PER_OUT+CLBIN0*SWITCH_PER_IN0]);
	    end
	 end
	 for(j = 0; j < WD/2; j = j + 1) begin : doubles
	    if((j + WD/2-(i*CLBOD)%(WD/2) + WD/2-CLBOD_BIAS_WIDTH) % (WD/2) < CLBOD) begin
	       transmission_gate_oneway s(double0[j], clb0_output[i], c[(j+WD/2-(i*CLBOD)%(WD/2)+WD/2-CLBOD_BIAS_WIDTH)%(WD/2)+CLBOS+i*SWITCH_PER_OUT+CLBIN0*SWITCH_PER_IN0]);
	    end
	 end
      end
   endgenerate
   
   localparam BASE = CLBOUT0*SWITCH_PER_OUT+CLBIN0*SWITCH_PER_IN0;
   
   generate
      for(i = 0; i < CLBIN1; i = i + 1) begin : clb1_inputs
	 for(j = 0; j < WS; j = j + 1) begin : singles
	    transmission_gate_oneway s(clb1_input[i], single0[j], c[BASE+j+i*SWITCH_PER_IN1]);
	 end
	 for(j = 0; j < WD; j = j + 1) begin : doubles
	    transmission_gate_oneway s(clb1_input[i], double0[j], c[BASE+j+WS+i*SWITCH_PER_IN1]);
	 end
	 for(j = 0; j < WG; j = j + 1) begin : globals
	    transmission_gate_oneway s(clb1_input[i], global[j], c[BASE+j+WS+WD+i*SWITCH_PER_IN1]);
	 end
	 if(CLBX) begin
	    for(j = 0; j < CLBOUT0; j = j + 1) begin : directs
	       transmission_gate_oneway s(clb1_input[i], clb0_output[j], c[BASE+j+WS+WD+WG+i*SWITCH_PER_IN1]);
	    end
	 end
      end
      for(i = 0; i < CLBOUT1; i = i + 1) begin : clb1_outputs
	 for(j = 0; j < WS; j = j + 1) begin : singles
	    if((j + WS-((i+CLBOUT0)*CLBOS)%WS + WS-CLBOS_BIAS_WIDTH) % WS < CLBOS) begin
	       transmission_gate_oneway s(single0[j], clb1_output[i], c[BASE+(j+WS-((i+CLBOUT0)*CLBOS)%WS+WS-CLBOS_BIAS_WIDTH)%WS+i*SWITCH_PER_OUT+CLBIN1*SWITCH_PER_IN1]);
	    end
	 end
	 for(j = 0; j < WD/2; j = j + 1) begin : doubles
	    if((j + WD/2-((i+CLBOUT0)*CLBOD)%(WD/2) + WD/2-CLBOD_BIAS_WIDTH) % (WD/2) < CLBOD) begin
	       transmission_gate_oneway s(double0[j], clb1_output[i], c[BASE+(j+WD/2-((i+CLBOUT0)*CLBOD)%(WD/2)+WD/2-CLBOD_BIAS_WIDTH)%(WD/2)+CLBOS+i*SWITCH_PER_OUT+CLBIN1*SWITCH_PER_IN1]);
	    end
	 end
      end
   endgenerate

   assign clb1_cin = clb0_cout;
   assign clb0_cin = clb1_cout;
   
endmodule
