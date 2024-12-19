// Seed: 1593851333
module module_0 (
    output uwire id_0,
    input wand id_1,
    input tri id_2,
    input tri0 id_3,
    output tri0 id_4,
    output wand id_5,
    output wire id_6,
    output wor id_7,
    input wor id_8,
    input supply1 id_9,
    input tri id_10,
    input supply1 id_11,
    input supply0 id_12,
    input wor id_13,
    output wire id_14,
    input supply0 id_15,
    input wor id_16,
    input tri0 id_17,
    input tri0 id_18,
    output supply1 id_19,
    output tri1 id_20,
    input uwire id_21,
    input tri id_22,
    output tri0 id_23,
    input tri id_24,
    input wire id_25,
    input tri0 id_26,
    output tri1 id_27,
    output wire id_28,
    output wand id_29,
    input tri id_30
);
  wire id_32;
  assign module_1.id_7 = 0;
  assign id_5 = id_30;
  generate
    id_33(
        .id_0(&1'b0)
    );
  endgenerate
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    input  wire  id_2,
    output tri0  id_3,
    input  uwire id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_0,
      id_4,
      id_0,
      id_2,
      id_0,
      id_3,
      id_4,
      id_0,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_2
  );
endmodule
