// Seed: 2864409984
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  ;
  assign #1 id_6 = id_2;
endmodule
module module_1 #(
    parameter id_3 = 32'd44,
    parameter id_9 = 32'd42
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  output logic [7:0] id_11;
  input logic [7:0] id_10;
  input wire _id_9;
  input wire id_8;
  inout wire id_7;
  inout wand id_6;
  inout wire id_5;
  inout logic [7:0] id_4;
  inout wire _id_3;
  output wire id_2;
  output wire id_1;
  id_12 :
  assert property (@(posedge id_8) 1)
  else $signed(73);
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_6,
      id_8
  );
  localparam id_13 = 1;
  assign id_11[1] = -1;
  parameter id_14 = -1;
  wire id_15;
  assign id_6 = 1'b0;
  tri id_16 = 1'b0 || id_10[-1!=~id_3];
  assign id_4[id_9] = 1 - id_13;
  wire id_17;
  wand id_18 = -1'b0;
  xnor primCall (id_4, id_8, id_5, id_10, id_7, id_6, id_12);
endmodule
