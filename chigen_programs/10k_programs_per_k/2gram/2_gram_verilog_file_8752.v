// Seed: 925834073
module module_0 (
    input tri id_0,
    input wor id_1,
    input uwire id_2,
    input tri0 id_3,
    input wor id_4,
    input tri1 id_5
    , id_19,
    input supply1 id_6,
    input wor id_7,
    input uwire id_8,
    output wire id_9,
    input tri id_10,
    input tri id_11,
    input wand id_12,
    input wire id_13,
    input tri1 id_14,
    output tri0 id_15,
    input wire id_16,
    output uwire id_17
);
  wire id_20;
  initial id_9 = id_0;
  wire id_21;
  wire id_22;
  assign module_1.id_10 = 0;
endmodule
macromodule module_1 (
    output uwire id_0,
    input wor id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    input uwire id_6,
    output wire id_7,
    output uwire id_8,
    output supply0 id_9,
    input wire id_10,
    input wand id_11,
    input supply0 id_12,
    output tri0 id_13,
    input uwire id_14,
    output tri id_15,
    input supply1 id_16,
    input supply0 id_17,
    output tri id_18
    , id_20
);
  assign id_9 = {id_11{id_5}};
  supply1 id_21;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_14,
      id_5,
      id_3,
      id_3,
      id_14,
      id_12,
      id_14,
      id_15,
      id_12,
      id_12,
      id_5,
      id_4,
      id_3,
      id_7,
      id_11,
      id_7
  );
  assign id_15 = id_21 >> id_17;
endmodule
