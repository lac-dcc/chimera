// Seed: 3028607154
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output wand id_2,
    output tri0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri0 id_6
);
  assign id_4 = id_6;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_0,
      id_5,
      id_0,
      id_1,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    input wire id_1,
    output supply0 id_2,
    input tri id_3,
    input wire id_4,
    input wand id_5,
    output supply1 id_6,
    output supply0 id_7,
    input supply1 id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_0,
      id_6,
      id_6,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    output wor id_0,
    input tri0 id_1,
    output wor id_2,
    input uwire id_3,
    output wire id_4,
    input tri1 id_5,
    input supply1 id_6,
    output wire id_7
);
  logic id_9 = id_3;
  assign id_4 = -1'b0;
  logic id_10;
  ;
endmodule
