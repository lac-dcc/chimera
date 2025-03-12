// Seed: 4054500201
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
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_28 = 32'd98
) (
    input supply1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri1 id_4,
    output tri1 id_5,
    input uwire id_6,
    input wire id_7,
    output logic id_8,
    input wand id_9,
    input wire id_10,
    inout supply1 id_11,
    output supply0 id_12,
    input wand id_13,
    output supply0 id_14,
    input wand id_15,
    output logic id_16,
    output wand id_17,
    output wor id_18,
    output tri0 id_19,
    output uwire id_20,
    output wor id_21,
    output logic id_22,
    input uwire id_23,
    output wor id_24,
    output supply1 id_25,
    input wor id_26,
    input wor id_27,
    input wire _id_28
);
  wire [id_28 : 1 'b0] id_30;
  assign id_24 = 1'h0 * id_26;
  wire id_31;
  always_latch id_16 <= -1;
  assign id_18 = id_0;
  always
  fork
    id_22 <= 1;
    fork
      id_8 = id_0 <-> {id_0, id_7};
    join
  join
  always id_22 <= -1'b0;
  module_0 modCall_1 (
      id_30,
      id_30,
      id_30,
      id_30,
      id_30,
      id_30,
      id_31,
      id_31,
      id_31,
      id_30,
      id_30,
      id_31,
      id_31,
      id_31,
      id_30,
      id_31,
      id_30
  );
endmodule
