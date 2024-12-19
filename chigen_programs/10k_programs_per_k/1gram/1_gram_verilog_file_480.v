// Seed: 1089191518
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    output tri0 id_3,
    input wand id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri id_7,
    output tri0 id_8,
    input tri id_9,
    input supply1 id_10,
    output tri0 id_11
);
  wire id_13;
  assign id_3 = 1;
  wire id_14;
endmodule
module module_1 (
    input tri0 id_0,
    input tri1 id_1,
    input uwire id_2,
    output wire id_3,
    input wand id_4,
    input tri0 id_5,
    output supply0 id_6,
    output tri1 id_7,
    output wire id_8,
    input tri0 id_9
    , id_14, id_15,
    output tri1 id_10,
    input tri id_11,
    output tri0 id_12
);
  wire id_16, id_17;
  nor primCall (id_8, id_11, id_14, id_1, id_17, id_5, id_0, id_4);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_2,
      id_12,
      id_1,
      id_7,
      id_0,
      id_1,
      id_8,
      id_4,
      id_9,
      id_8
  );
  assign modCall_1.type_18 = 0;
endmodule
