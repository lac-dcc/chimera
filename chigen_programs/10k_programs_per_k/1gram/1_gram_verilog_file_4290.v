// Seed: 2697804989
module module_0 (
    input wire id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri id_3,
    output tri id_4,
    output tri0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    output uwire id_8,
    input supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wor id_12,
    output wire id_13,
    output supply1 id_14,
    output wor id_15,
    input tri0 id_16,
    input uwire id_17,
    output tri0 id_18,
    input supply1 id_19,
    input supply0 id_20,
    output supply1 id_21,
    input tri0 id_22,
    output wire id_23,
    input wire id_24,
    input wor id_25,
    output wand id_26
);
  supply0 id_28 = 1;
  wand id_29, id_30, id_31 = 1, id_32, id_33;
  wire id_34;
  assign module_1.type_4 = 0;
  wire id_35;
  wire id_36;
endmodule
module module_1 (
    input uwire id_0,
    input wand void id_1,
    input tri0 id_2,
    output wand id_3,
    input tri0 id_4,
    input wire id_5,
    input wor id_6,
    output tri id_7
    , id_18,
    input wor id_8,
    output supply1 id_9,
    input tri id_10,
    output supply1 id_11,
    output supply0 id_12,
    input wor id_13,
    output wire id_14,
    input supply0 id_15,
    output tri0 id_16
);
  wire id_19;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_6,
      id_5,
      id_3,
      id_3,
      id_4,
      id_9,
      id_9,
      id_2,
      id_8,
      id_18,
      id_13,
      id_7,
      id_11,
      id_9,
      id_4,
      id_18,
      id_11,
      id_8,
      id_8,
      id_16,
      id_10,
      id_12,
      id_2,
      id_15,
      id_11
  );
  assign id_18 = id_15;
  id_20(
      .id_0(id_19), .id_1(1), .id_2(id_14 || 1), .id_3(1'b0)
  );
endmodule
