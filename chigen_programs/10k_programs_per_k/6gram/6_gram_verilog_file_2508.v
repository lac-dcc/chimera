// Seed: 3501899705
module module_0 (
    input  tri0 id_0,
    output wire id_1,
    input  wire id_2,
    output tri1 id_3
);
  timeprecision 1ps;
endmodule
macromodule module_1 (
    output tri id_0,
    output uwire id_1,
    input uwire id_2,
    output tri0 id_3,
    output tri1 id_4,
    input tri0 id_5,
    inout tri0 id_6,
    output supply1 id_7,
    input tri id_8,
    input wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    output supply0 id_12,
    input supply0 id_13,
    input wor id_14,
    input wire id_15,
    output supply1 id_16,
    output wor id_17
);
  wire id_19;
  or primCall (id_17, id_2, id_11, id_15, id_6, id_10, id_19, id_13, id_8, id_14);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_17
  );
  assign modCall_1.type_6 = 0;
endmodule
