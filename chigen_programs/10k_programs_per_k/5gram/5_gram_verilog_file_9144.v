// Seed: 31788627
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    output supply0 sample,
    output wand id_4,
    output uwire id_5,
    output supply0 module_0,
    input tri0 id_7,
    output tri id_8,
    input supply0 id_9,
    input tri0 id_10,
    input wor id_11,
    input wor id_12,
    output supply0 id_13,
    input wand id_14,
    output wand id_15,
    output tri0 id_16,
    output tri id_17
);
  wire id_19;
  assign module_1.id_6 = 0;
  id_20(
      .id_0(id_5), .id_1(id_0), .id_2(1)
  );
endmodule
module module_1 (
    input tri id_0,
    output tri id_1,
    input uwire id_2,
    output wor id_3,
    input tri0 id_4
    , id_26,
    input tri id_5,
    input tri1 id_6,
    output tri1 id_7,
    input tri1 id_8,
    input wor id_9,
    output tri id_10
    , id_27,
    input tri1 id_11,
    output uwire id_12,
    input wor id_13,
    input supply1 id_14,
    input tri1 id_15,
    input tri1 id_16,
    output uwire id_17,
    input wire id_18,
    input wor id_19,
    output wor id_20,
    output supply0 id_21,
    input wand id_22,
    input wor id_23,
    output tri1 id_24
);
  initial assume (id_2);
  nor primCall (
      id_17,
      id_19,
      id_18,
      id_5,
      id_27,
      id_15,
      id_26,
      id_9,
      id_23,
      id_13,
      id_6,
      id_16,
      id_22,
      id_11,
      id_4,
      id_14,
      id_8,
      id_2
  );
  module_0 modCall_1 (
      id_0,
      id_11,
      id_10,
      id_10,
      id_12,
      id_17,
      id_24,
      id_14,
      id_10,
      id_13,
      id_9,
      id_22,
      id_4,
      id_24,
      id_2,
      id_24,
      id_12,
      id_17
  );
endmodule
