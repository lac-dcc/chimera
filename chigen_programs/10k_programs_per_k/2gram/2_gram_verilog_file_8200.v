// Seed: 3976246819
module module_0 (
    output tri1 id_0,
    output uwire id_1,
    input wand id_2,
    input wor id_3,
    output wand id_4,
    output tri1 id_5,
    input supply1 id_6,
    input tri1 id_7,
    input wire id_8,
    input tri1 id_9
);
  always assume (id_2 & 1);
  logic [7:0] id_11;
  integer id_12;
  assign id_1 = id_11[1] - id_8;
  assign id_0 = 1;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input wire id_2,
    input supply1 id_3,
    input wor id_4,
    output tri id_5
);
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_0,
      id_5,
      id_5,
      id_1,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
