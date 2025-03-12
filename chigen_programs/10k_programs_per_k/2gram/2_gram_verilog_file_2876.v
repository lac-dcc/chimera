// Seed: 2394014071
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wand id_3,
    output tri1 id_4,
    output uwire id_5
);
  logic id_7;
  generate
    wire id_8;
    ;
    wire id_9;
  endgenerate
  wire  id_10;
  wire  id_11;
  logic id_12;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri0 id_5,
    input wand id_6,
    input wire id_7,
    input tri id_8
);
  genvar id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
