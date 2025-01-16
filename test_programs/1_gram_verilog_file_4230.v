// Seed: 3461776627
module module_0 (
    output wire id_0,
    input wire id_1,
    input tri1 id_2,
    output tri1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input wire id_6,
    input wire id_7,
    output tri id_8,
    output tri id_9,
    output tri0 id_10,
    output tri id_11,
    input supply1 id_12,
    input tri id_13,
    input uwire id_14,
    input wire id_15
);
  generate
    wire id_17;
  endgenerate
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    input wor id_2,
    output tri id_3,
    input tri0 id_4,
    input supply0 id_5
);
  nor primCall (id_0, id_2, id_5, id_1);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_2,
      id_3,
      id_2,
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_8 = 0;
endmodule
