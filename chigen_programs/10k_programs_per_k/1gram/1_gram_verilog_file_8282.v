// Seed: 3765145679
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_4
  );
  always_comb id_1 = 1;
endmodule
module module_2 (
    input  tri0 id_0,
    output wor  id_1,
    input  tri  id_2,
    output tri  id_3,
    input  tri1 id_4,
    output tri1 id_5,
    output wire id_6
);
  wire id_8;
endmodule
module module_3 (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    input supply0 id_3,
    input uwire id_4,
    output uwire id_5,
    input uwire id_6,
    output wire id_7,
    input wire id_8,
    output tri1 id_9,
    input supply1 id_10,
    input tri1 id_11,
    input tri id_12,
    output wand id_13,
    input supply0 id_14,
    output wand id_15,
    input wor id_16,
    input wor id_17
);
  module_2 modCall_1 (
      id_4,
      id_2,
      id_17,
      id_2,
      id_8,
      id_13,
      id_13
  );
  assign modCall_1.id_2 = 0;
endmodule
