// Seed: 1465596862
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri id_2,
    output tri1 id_3,
    input wor id_4
);
  assign id_2 = id_1 <-> id_1;
  uwire id_6 = 1;
  rtran (id_4, 1);
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    output supply1 id_3
    , id_19,
    input supply0 id_4,
    output supply1 id_5,
    input tri0 id_6,
    output tri0 id_7,
    input tri id_8,
    output tri id_9,
    input uwire id_10,
    inout uwire id_11,
    output wire id_12,
    output supply1 id_13,
    input supply1 id_14,
    output supply0 id_15,
    input supply0 id_16,
    output wire id_17
);
  wire id_20;
  nor primCall (id_1, id_10, id_11, id_8, id_2, id_14, id_16, id_20);
  module_0 modCall_1 (
      id_14,
      id_11,
      id_15,
      id_13,
      id_6
  );
  assign modCall_1.type_0 = 0;
  assign id_15 = 1'b0;
  assign #id_21 id_20 = 1'b0;
endmodule
