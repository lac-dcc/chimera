// Seed: 196720574
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
    id_15
);
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    output supply1 id_0,
    output tri1 id_1,
    output supply0 id_2,
    inout wire id_3,
    output tri0 id_4,
    input wand id_5,
    input tri1 id_6,
    input wor id_7,
    input supply1 id_8,
    input supply0 id_9,
    output tri0 id_10,
    output supply1 id_11,
    id_15,
    input tri0 id_12,
    output tri id_13
);
  tri1 id_16;
  always id_2.id_7 += {id_15, id_7};
  wire id_17, id_18, id_19;
  parameter id_20 = id_9 - {id_12{id_16}};
  or primCall (
      id_11,
      id_23,
      id_24,
      id_6,
      id_21,
      id_7,
      id_26,
      id_19,
      id_16,
      id_18,
      id_25,
      id_12,
      id_17,
      id_9,
      id_3,
      id_15,
      id_20,
      id_8,
      id_22,
      id_5
  );
  wire id_21;
  tri0 id_22 = -1;
  wire id_23;
  always $display(-1, id_22, 1);
  wire id_24, id_25, id_26;
  module_0 modCall_1 (
      id_20,
      id_20,
      id_26,
      id_22,
      id_21,
      id_19,
      id_21,
      id_17,
      id_26,
      id_23,
      id_19,
      id_19,
      id_26,
      id_17,
      id_23
  );
endmodule
