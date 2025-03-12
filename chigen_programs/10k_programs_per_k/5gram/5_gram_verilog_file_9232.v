// Seed: 3049468135
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  output tri1 id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input logic [7:0] id_1;
  assign id_9 = id_1[1&1&-1];
  wire id_12;
  assign id_9 = -1 - id_10 & !id_10;
  assign module_1._id_13 = 0;
  wire id_13;
endmodule
module module_1 #(
    parameter id_13 = 32'd0,
    parameter id_7  = 32'd53
) (
    output supply1 id_0,
    input tri id_1,
    output supply0 id_2,
    output tri0 id_3,
    input uwire id_4,
    input tri0 id_5,
    input supply0 id_6,
    input supply1 _id_7,
    input supply0 id_8,
    input tri1 id_9,
    output wire id_10,
    output wire id_11,
    output tri0 id_12,
    input wire _id_13,
    input wand id_14,
    output wire id_15,
    input wire id_16
);
  wire id_18;
  logic [7:0] id_19;
  module_0 modCall_1 (
      id_19,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18,
      id_18
  );
  assign id_11 = -1 || id_19[id_13 : id_7];
  xnor primCall (id_3, id_6, id_4, id_16, id_5, id_19, id_14, id_8, id_1);
endmodule
