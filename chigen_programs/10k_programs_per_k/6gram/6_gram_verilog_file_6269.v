// Seed: 3078855618
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
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_17;
endmodule
module module_1 #(
    parameter id_15 = 32'd31
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
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  inout wire id_26;
  module_0 modCall_1 (
      id_22,
      id_6,
      id_3,
      id_20,
      id_11,
      id_2,
      id_1,
      id_1,
      id_4,
      id_25,
      id_6,
      id_6,
      id_4,
      id_7,
      id_16,
      id_23
  );
  input wire id_25;
  output wire id_24;
  output wire id_23;
  input wire id_22;
  input wire id_21;
  input wire id_20;
  inout logic [7:0] id_19;
  xor primCall (
      id_23, id_20, id_19, id_11, id_6, id_26, id_4, id_16, id_21, id_22, id_25, id_1, id_5
  );
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire _id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout supply1 id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_19[id_15] = 1'b0;
  wire id_27;
  assign id_6 = -1'b0 ? id_26 == id_20 : id_20 - 1'b0;
endmodule
