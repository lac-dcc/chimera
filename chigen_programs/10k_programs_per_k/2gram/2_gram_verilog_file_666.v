// Seed: 30962969
macromodule module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  genvar id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2
  );
  input logic [7:0] id_1;
  logic id_4 = id_1[1'h0] - id_1;
  wire  id_5;
endmodule
module module_2 (
    output wire id_0,
    output wand id_1,
    input tri0 id_2,
    output wor id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input uwire id_7,
    output wand id_8,
    output tri0 id_9,
    input uwire id_10,
    input tri id_11,
    input wor id_12,
    output supply1 id_13,
    output tri id_14,
    output supply1 id_15,
    input supply0 id_16,
    output wor id_17,
    output tri id_18,
    output tri0 id_19
);
  assign id_15 = 1'd0;
endmodule
module module_3 (
    input supply1 id_0,
    input tri id_1,
    output tri id_2,
    input wor id_3,
    input tri1 id_4,
    output uwire id_5,
    input wand id_6,
    input tri1 id_7,
    input tri0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    input wire id_11
);
  wire id_13;
  module_2 modCall_1 (
      id_2,
      id_5,
      id_8,
      id_5,
      id_2,
      id_9,
      id_7,
      id_10,
      id_2,
      id_5,
      id_1,
      id_0,
      id_6,
      id_5,
      id_5,
      id_5,
      id_7,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_17 = 0;
endmodule
