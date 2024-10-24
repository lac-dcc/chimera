// Seed: 1348174356
`define pp_5 (  pp_6  ,  pp_7  ,  pp_8  )  0
`timescale 1 ps / 1ps
module module_0 (
    output reg id_0,
    input id_1,
    output id_2,
    output logic id_3,
    input id_4
);
  logic id_5;
  assign id_5 = 1;
  reg id_6;
  reg id_7;
  reg id_8;
  assign id_5 = id_4;
  assign id_7 = id_5 - 1'b0;
  initial begin
    SystemTFIdentifier(1, id_5 & id_4);
  end
  always @* id_7 <= 1;
  logic id_9;
  rpmos (~id_1[1], 1, 1'b0, 1'h0, 1'b0);
  always @(posedge id_7 or posedge ~id_5) begin
    if (1 - id_9) SystemTFIdentifier(id_4);
    else begin
      #1;
    end
  end
  reg id_10;
  type_19(
      id_7, 1, id_2
  );
  logic id_11;
  assign id_7  = 1;
  assign id_10 = !1;
  assign id_2  = 1;
  type_21(
      1, id_0, id_6, id_10
  );
  always @(posedge id_8) begin
    id_8 <= id_6;
  end
endmodule
