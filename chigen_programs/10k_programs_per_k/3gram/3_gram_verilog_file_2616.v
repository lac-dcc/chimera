// Seed: 3925553906
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    input wand id_3,
    input tri id_4,
    input tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    output tri0 id_8,
    output uwire id_9,
    input tri1 id_10,
    output supply0 id_11,
    output wire id_12,
    input wand id_13,
    output supply0 id_14,
    input supply1 id_15,
    output uwire id_16,
    output wand id_17,
    output uwire id_18,
    output uwire id_19,
    input wand id_20,
    input supply0 id_21,
    output tri1 id_22,
    input tri id_23,
    input wor id_24,
    output tri1 id_25,
    input supply1 id_26,
    input tri1 id_27
);
  wire id_29;
endmodule
module module_1 (
    input  supply1 id_0,
    input  logic   id_1,
    output logic   id_2,
    output logic   id_3
);
  wand id_5;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_5,
      id_0,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_5,
      id_0,
      id_0
  );
  assign modCall_1.type_18 = 0;
  always_latch @(posedge 1'b0) if (id_1) id_2 = #id_6 id_0 * id_6 * 1 + id_5;
  assign id_5 = id_0;
  wire id_7, id_8;
  wire id_9;
endmodule
