`timescale 1ns/1ps

// © Copyright Microsoft Corporation, 2008

module dqs_iob (
 input MCLK,
 input ODDRD1,
 input ODDRD2,
 input preDQSenL,
 inout DQS, //The pin signal
 inout DQSL
 )/* synthesis syn_sharing = off */;

 wire dqsOut;
 (* syn_preserve=1, syn_useioff = 1 *) reg DQSenL;

 always@(negedge MCLK) DQSenL <= preDQSenL; //Tristate enable
 
ODDR #(
.DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE"
.INIT(1'b0), // Initial value of Q: 1'b0 or 1'b1
.SRTYPE("SYNC") // Set/Reset type: "SYNC" or "ASYNC"
)  oddr_dqs (
  .Q (dqsOut),
  .C (~MCLK),
  .CE (1'b1),
  .D1 (ODDRD1),
  .D2 (ODDRD2),
  .R (1'b0),
  .S (1'b0)
  );
  
 IOBUFDS #(.IOSTANDARD("DIFF_SSTL18_II_DCI")) iobuf_dqs (
  .O (),
  .IO (DQS),
  .IOB(DQSL),
  .I (dqsOut),
  .T (DQSenL)
  );

endmodule