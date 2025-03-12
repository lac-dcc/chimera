// Seed: 1651036987
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
    id_24,
    id_25,
    id_26,
    id_27
);
  input wire id_27;
  input wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  output wire id_22;
  inout reg id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input supply1 id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output tri0 id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_28;
  wire id_29, id_30, id_31;
  always id_21 <= id_1;
  assign id_7 = {1, id_12};
endmodule
module module_1 #(
    parameter id_0 = 32'd59
) (
    input supply1 _id_0
);
  bit id_2;
  supply1 id_3;
  assign id_3 = 1;
  logic [id_0 : -1] id_4;
  wire ['b0 : -1 'b0] id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_5,
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_2,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5
  );
  logic [1 : -1] id_6, id_7, id_8, id_9;
  logic id_10 = 1;
  always
  fork
    id_2 <= #id_3 id_2;
  join
endmodule
