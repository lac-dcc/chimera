// Seed: 1145979305
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input wand id_2,
    output tri id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7
);
  always_latch id_3 = id_2;
  assign id_1 = 1;
endmodule
module module_1 (
    output wand id_0,
    input tri1 id_1,
    input wand id_2,
    output tri0 id_3,
    output tri0 id_4,
    input wor id_5,
    output tri1 id_6,
    input wire id_7,
    output supply0 id_8,
    input tri0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    output uwire id_12,
    output tri1 id_13,
    input supply1 id_14,
    input uwire id_15,
    input tri0 id_16,
    input wor id_17,
    input tri id_18,
    input tri0 id_19,
    input tri id_20,
    input supply1 id_21
    , id_26,
    output uwire id_22,
    input tri0 id_23,
    input wor id_24
);
  assign id_26#(.id_17(1)) = 1 && 1;
  assign id_26 = id_23;
  wire id_27;
  id_28(
      .id_0(1)
  );
  module_0 modCall_1 (
      id_14,
      id_26,
      id_16,
      id_4,
      id_11,
      id_21,
      id_18,
      id_22
  );
  assign modCall_1.type_2 = 0;
  wire id_29;
  logic [7:0][1] id_30;
  wire id_31;
  assign id_8 = 1;
  nor primCall (
      id_22,
      id_23,
      id_24,
      id_19,
      id_17,
      id_26,
      id_18,
      id_10,
      id_11,
      id_15,
      id_2,
      id_14,
      id_7,
      id_28,
      id_21,
      id_9,
      id_5,
      id_16,
      id_27
  );
endmodule
