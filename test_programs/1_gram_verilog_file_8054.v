// Seed: 1653568075
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  inout wire id_23;
  input wire id_22;
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_20 = {-1'b0{id_22 & id_19}};
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
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_13;
  wire id_14;
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_12,
      id_4,
      id_9,
      id_4,
      id_7,
      id_5,
      id_4,
      id_13,
      id_9,
      id_7,
      id_7,
      id_13,
      id_2,
      id_10,
      id_2,
      id_13,
      id_4,
      id_7,
      id_11,
      id_2,
      id_7,
      id_13
  );
  assign modCall_1.id_7 = 0;
endmodule
