// Seed: 3813692963
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    output uwire id_2,
    output wire id_3,
    output tri0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    output uwire id_7,
    input wire id_8,
    output wor id_9
);
  wire id_11;
  assign id_3 = (-1);
  logic id_12;
endmodule
module module_1 (
    input wor id_0,
    inout uwire id_1,
    input wire id_2,
    output wand id_3,
    input supply1 id_4,
    output wire id_5,
    input wire id_6,
    input wand id_7,
    output uwire id_8
);
  wire id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_8,
      id_8,
      id_1,
      id_7,
      id_5,
      id_2,
      id_5
  );
  assign modCall_1.id_1 = 0;
endmodule
