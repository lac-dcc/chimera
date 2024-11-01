// Seed: 1815239755
module module_0 (
    input uwire id_0,
    input tri   id_1,
    input uwire id_2,
    input uwire id_3,
    input wor   id_4,
    input tri   id_5
);
  wire id_7;
  wor  id_8;
  wire id_9;
  assign id_8 = id_2;
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1,
    output wire id_2
    , id_21,
    input tri0 id_3,
    input wand id_4,
    output supply1 id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input tri id_9,
    inout tri0 id_10,
    output wand id_11,
    output wor id_12#(.id_22(~id_10)),
    output tri id_13
    , id_23,
    input tri1 id_14,
    input wand id_15,
    output supply1 id_16,
    input supply1 id_17
    , id_24,
    input wand id_18,
    input wire id_19
    , id_25
);
  assign id_23 = 1 == id_3 && 1'b0;
  wire id_26;
  id_27(
      id_12
  );
  nor (
      id_10,
      id_7,
      id_15,
      id_22,
      id_21,
      id_23,
      id_27,
      id_25,
      id_26,
      id_8,
      id_24,
      id_3,
      id_0,
      id_9,
      id_18,
      id_14
  );
  module_0(
      id_0, id_0, id_10, id_14, id_17, id_19
  );
endmodule
