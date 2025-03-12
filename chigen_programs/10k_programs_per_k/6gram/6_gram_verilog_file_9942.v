// Seed: 3416956398
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
    id_16,
    id_17
);
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
endmodule
module module_1 #(
    parameter id_13 = 32'd55
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
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  inout logic [7:0] id_20;
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire _id_13;
  inout wire id_12;
  input wire id_11;
  module_0 modCall_1 (
      id_19,
      id_6,
      id_6,
      id_19,
      id_10,
      id_3,
      id_19,
      id_12,
      id_9,
      id_3,
      id_9,
      id_19,
      id_15,
      id_6,
      id_4,
      id_9,
      id_8
  );
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_20[id_13+1] = id_2;
  supply0 [-1 : 1  ==  -1] id_21 = -1;
  tri id_22 = id_3 & id_17#(.id_17(!1)) && id_15;
  assign id_4 = (id_10);
endmodule
