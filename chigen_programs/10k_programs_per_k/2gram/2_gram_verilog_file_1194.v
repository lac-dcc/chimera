// Seed: 3080458652
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  tri id_17 = {id_7, id_13, 1, id_10};
  supply1 id_18;
  wire id_19;
  assign id_14 = id_9;
  tri0 id_20;
  wire id_21;
  assign id_15 = id_10;
  wire id_22, id_23;
  assign id_14 = id_20 & 1'h0;
  assign id_20 = 1'h0 & 1;
  assign #id_24 id_20 = id_18;
  wor id_25 = 1 ^ id_11;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    id_5 <= id_3 << id_5;
  end
  wire id_10;
  assign id_4 = 1;
  assign id_5 = "" && id_2 == 1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_10,
      id_6,
      id_7,
      id_10,
      id_2,
      id_10,
      id_10,
      id_3,
      id_3,
      id_10,
      id_9,
      id_4
  );
  assign modCall_1.type_32 = 0;
endmodule
