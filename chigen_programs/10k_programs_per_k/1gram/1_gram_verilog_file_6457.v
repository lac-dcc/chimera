// Seed: 1966520834
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7 (1),
        .id_8 (id_9),
        .id_10(id_11),
        .id_12(id_13)
    ),
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
    id_26
);
  input wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  assign module_1.id_7 = 0;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_24 = 1;
  parameter id_27 = 1;
endmodule
module module_1 (
    output wor id_0,
    output uwire id_1,
    input wor id_2,
    output wor id_3,
    output tri1 id_4,
    input supply1 id_5,
    input wor id_6,
    output supply0 id_7,
    output tri id_8,
    input tri0 id_9,
    input tri0 id_10,
    output tri0 id_11,
    input wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    input supply0 id_15
);
  wire [-1  |  1 : 1] id_17;
  assign id_3 = id_13;
  wire id_18;
  and primCall (
      id_11, id_10, id_6, id_5, id_18, id_19, id_13, id_17, id_2, id_14, id_12, id_15, id_9
  );
  assign id_4 = id_18;
  wire [1 : 1] id_19;
  module_0 modCall_1 (
      id_19,
      id_19,
      id_17,
      id_18,
      id_18,
      id_17,
      id_18,
      id_17,
      id_19,
      id_19,
      id_19,
      id_18,
      id_19,
      id_17,
      id_19,
      id_17,
      id_17,
      id_17,
      id_18
  );
endmodule
