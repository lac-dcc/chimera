// Seed: 794346518
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_9(
      -1
  );
  wire id_10;
endmodule
program module_1 #(
    parameter id_1  = 32'd29,
    parameter id_11 = 32'd37,
    parameter id_13 = 32'd35,
    parameter id_3  = 32'd93,
    parameter id_6  = 32'd18,
    parameter id_9  = 32'd28
) (
    output tri1 id_0,
    input  wor  _id_1,
    input  wor  id_2,
    input  wire _id_3,
    output tri0 id_4
);
  wire _id_6;
  always_latch $clog2(74);
  ;
  wire [-1 : id_1] id_7, id_8, _id_9;
  logic [7:0][1  ?  id_6 : id_9 : -1] id_10, _id_11;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_7,
      id_7
  );
  id_12 :
  assert property (@(negedge 1'h0 - id_10[id_11 : id_1]) id_2 | id_7) #1;
  wire _id_13;
  wire [id_1 : -1] id_14[id_3 : id_13];
  wire id_15;
  parameter id_16 = -1'b0;
  logic id_17 = -1;
  logic id_18;
  assign id_18 = (id_7);
  wire id_19, id_20, id_21, id_22;
endprogram
