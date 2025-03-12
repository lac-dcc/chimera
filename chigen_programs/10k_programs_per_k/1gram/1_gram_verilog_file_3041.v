// Seed: 518831996
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
  inout logic [7:0] id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_7[-1] = id_7;
  wire id_9;
endmodule
module module_1 #(
    parameter id_12 = 32'd25,
    parameter id_2  = 32'd43,
    parameter id_3  = 32'd72
) (
    id_1,
    _id_2
);
  input wire _id_2;
  output wire id_1;
  bit _id_3, id_4;
  logic [7:0][id_3] id_5;
  wire id_6, id_7;
  always if (-1) id_4 <= id_2 + id_5;
  bit [-1 'h0 : id_2] id_8, id_9, id_10;
  logic [7:0] id_11;
  _id_12 :
  assert property (@(id_10 ? id_5[id_12] : id_12) id_11[-1]) @(id_4) #1 id_10 <= -1;
  wire ["" : id_2] id_13, id_14, id_15;
  module_0 modCall_1 (
      id_1,
      id_15,
      id_14,
      id_13,
      id_6,
      id_13,
      id_5,
      id_7
  );
endmodule
