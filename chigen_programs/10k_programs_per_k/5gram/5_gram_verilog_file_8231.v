// Seed: 458358763
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  assign module_1.type_1 = 0;
  wire id_5;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    output wand id_2
    , id_22,
    input wire id_3,
    input wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    input uwire id_7,
    output wor id_8,
    input wor id_9,
    output uwire id_10,
    input uwire id_11,
    output uwire id_12,
    input supply0 id_13,
    input tri id_14,
    output tri id_15,
    input supply1 id_16,
    input wand id_17,
    output supply1 id_18,
    output supply0 id_19,
    input supply1 id_20
);
  tri id_23 = 1;
  nor primCall (
      id_19,
      id_13,
      id_11,
      id_20,
      id_3,
      id_5,
      id_23,
      id_9,
      id_16,
      id_22,
      id_6,
      id_7,
      id_14,
      id_4,
      id_17,
      id_0
  );
  always_latch @(*) #1;
  module_0 modCall_1 (
      id_22,
      id_23,
      id_23
  );
endmodule
