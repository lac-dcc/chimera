// Seed: 2480692911
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7 = id_5[1], id_8;
endmodule
module module_1 #(
    parameter id_16 = 32'd55
) (
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    _id_16,
    id_17
);
  input wire id_17;
  module_0 modCall_1 (
      id_6,
      id_13,
      id_15,
      id_5,
      id_8,
      id_3
  );
  input wire _id_16;
  input wire id_15;
  inout wire id_14;
  xor primCall (
      id_3, id_10, id_2, id_7, id_17, id_1, id_14, id_6, id_8, id_12, id_11, id_13, id_15
  );
  inout supply1 id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_13 = id_15 & id_8[-1 : id_16];
  wire id_18;
endmodule
