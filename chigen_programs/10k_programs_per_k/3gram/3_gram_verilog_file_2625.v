// Seed: 1643506299
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    output wire id_3,
    input tri1 id_4,
    output tri0 id_5,
    input supply0 id_6,
    input uwire id_7,
    input tri id_8,
    output wire id_9,
    input tri0 id_10,
    output tri id_11,
    input tri0 id_12,
    output tri id_13
);
  assign id_11 = id_6 ? -1'b0 : -1'b0 ? id_7 : 1 ? id_8 : 1 ? id_7 : -1;
  localparam id_15 = 1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    input  wand  id_2
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule
