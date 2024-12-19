// Seed: 3340704220
module module_0 (
    input  tri0  id_0,
    output uwire id_1
);
endmodule
module module_1 (
    output tri id_0,
    input supply0 id_1
    , id_19,
    input wire id_2,
    input wand id_3,
    input tri0 id_4,
    output supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    input wand id_8,
    output supply1 id_9,
    input tri0 id_10,
    input uwire id_11,
    input wand id_12,
    input supply0 id_13,
    input tri id_14,
    input wor id_15,
    input supply1 id_16,
    input tri0 id_17
);
  assign id_19[1'b0] = id_15;
  wire id_20;
  nor primCall (id_5, id_10, id_8, id_13, id_2, id_12, id_15, id_3, id_17, id_6, id_4);
  module_0 modCall_1 (
      id_15,
      id_5
  );
  assign modCall_1.type_3 = 0;
  assign id_5 = 1;
endmodule
