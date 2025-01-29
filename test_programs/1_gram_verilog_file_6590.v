// Seed: 3862524367
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    id_26,
    output tri id_2,
    output supply1 id_3,
    input supply1 id_4,
    input wor id_5,
    input supply1 id_6,
    output tri0 id_7,
    output tri1 id_8,
    input supply1 id_9,
    input supply1 id_10,
    input supply1 id_11,
    input uwire id_12,
    input supply0 id_13,
    input uwire id_14,
    id_27,
    output tri0 id_15,
    input supply1 id_16,
    id_28,
    output tri1 id_17,
    output uwire id_18,
    output tri0 id_19,
    id_29,
    output uwire id_20,
    output tri0 id_21,
    input wor id_22,
    input tri1 id_23,
    input tri1 id_24,
    id_30
);
  wire id_31, id_32;
  assign module_1.id_2 = 0;
  assign id_3 = this;
endmodule
program module_1 (
    input wor id_0,
    input uwire id_1,
    input tri0 id_2,
    output logic id_3,
    input uwire id_4,
    input wire id_5,
    input tri id_6,
    output wand id_7,
    output tri id_8,
    output wor id_9,
    output supply1 id_10,
    input uwire id_11,
    input tri1 id_12
);
  wire id_14;
  assign id_7 = id_6;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_10,
      id_9,
      id_5,
      id_11,
      id_6,
      id_8,
      id_9,
      id_2,
      id_12,
      id_2,
      id_4,
      id_1,
      id_11,
      id_9,
      id_6,
      id_8,
      id_9,
      id_8,
      id_7,
      id_8,
      id_6,
      id_6,
      id_4
  );
  always_latch if (id_5) id_3 <= -1;
endmodule
