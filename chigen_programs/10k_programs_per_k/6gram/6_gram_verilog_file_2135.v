// Seed: 3590728411
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_12 = 32'd97,
    parameter id_15 = 32'd53,
    parameter id_4  = 32'd86
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    _id_12,
    id_13,
    id_14
);
  input wire id_14;
  inout wire id_13;
  input wire _id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output reg id_6;
  output wire id_5;
  input wire _id_4;
  inout supply1 id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_3 = 1 | 1'b0;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_8,
      id_5
  );
  wire [-1 : id_12] _id_15;
  logic id_16;
  wire id_17;
  xor primCall (id_5, id_8, id_10, id_13, id_11, id_9, id_14, id_3, id_2);
  always @(posedge 1'b0 or posedge id_2[id_4^id_15<=-1]) begin : LABEL_0
    id_6 <= #id_17 id_13;
  end
endmodule
