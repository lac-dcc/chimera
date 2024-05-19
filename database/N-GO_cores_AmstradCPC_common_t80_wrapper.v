// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:39:55 05/13/2012 
// Design Name: 
// Module Name:    tv80_to_t80_wrapper 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module z80 (
  // Outputs
  m1_n, mreq_n, iorq_n, rd_n, wr_n, rfsh_n, halt_n, busak_n, A, dout,
  // Inputs
  reset_n, clk, wait_n, int_n, nmi_n, busrq_n, di
  );

  input         reset_n; 
  input         clk; 
  input         wait_n; 
  input         int_n; 
  input         nmi_n; 
  input         busrq_n; 
  output        m1_n; 
  output        mreq_n; 
  output        iorq_n; 
  output        rd_n; 
  output        wr_n; 
  output        rfsh_n; 
  output        halt_n; 
  output        busak_n; 
  output [15:0] A;
  input [7:0]   di;
  output [7:0]  dout;

  wire [7:0] d;


  z80_top_direct_n cpu_goran (
    .nM1(m1_n),
    .nMREQ(mreq_n),
    .nIORQ(iorq_n),
    .nRD(rd_n),
    .nWR(wr_n),
    .nRFSH(rfsh_n),
    .nHALT(halt_n),
    .nBUSACK(busak_n),
    .nWAIT(wait_n),
    .nINT(int_n),
    .nNMI(nmi_n),
    .nRESET(reset_n),
    .nBUSRQ(busrq_n),
    .CLK(clk),
    .A(A),
    .D(d)
);


//  T80a_verilog TheCPU (
//    .RESET_n(reset_n),
//		.CLK_n(clk),
//		.WAIT_n(wait_n),
//		.INT_n(int_n),
//		.NMI_n(nmi_n),
//		.BUSRQ_n(busrq_n),
//		.M1_n(m1_n),
//		.MREQ_n(mreq_n),
//		.IORQ_n(iorq_n),
//		.RD_n(rd_n),
//		.WR_n(wr_n),
//		.RFSH_n(rfsh_n),
//		.HALT_n(halt_n),
//		.BUSAK_n(busak_n),
//		.A(A),
//		.D(d)
//	);
	
  // Detector de OUT (C),0
  reg [2:0] state = 3'd0;
  reg [7:0] opcode = 8'h00;
  always @(posedge clk) begin
    if (mreq_n == 1'b0 && rd_n == 1'b0 && m1_n == 1'b0)
      opcode <= di;
    if (reset_n == 1'b0)
      state <= 3'd0;
    else begin
      case (state)
        3'd0: if (mreq_n == 1'b0 && rd_n == 1'b0 && m1_n == 1'b0) state <= 3'd1;
        3'd1: if (m1_n == 1'b1) begin
                if (opcode == 8'hED)
                  state <= 3'd2;
                else
                  state <= 3'd0;
              end
        3'd2: if (mreq_n == 1'b0 && rd_n == 1'b0 && m1_n == 1'b0) state <= 3'd3;
        3'd3: if (m1_n == 1'b1) begin
                if (opcode == 8'h71)
                  state <= 3'd4;
                else
                  state <= 3'd0;
              end
        3'd4: if (iorq_n == 1'b0) state <= 3'd5;
        3'd5: if (iorq_n == 1'b1) state <= 3'd0;
      endcase
    end
  end

  assign dout = (state == 3'd4 || state == 3'd5)? 8'h00 : d;
  assign d = (!m1_n && !iorq_n)? 8'hFF :
             (!rd_n)? di : 8'hZZ;

endmodule
