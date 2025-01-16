// Seed: 3168726374
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output tri0 id_7
);
  id_9(
      id_5, id_4, 1'b0
  );
  wire id_10;
  wire id_11;
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    input wire id_2,
    output wand id_3,
    output tri0 id_4,
    input wor id_5,
    input wire id_6,
    output supply0 id_7,
    output supply0 id_8
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_5,
      id_5,
      id_6,
      id_8
  );
  assign modCall_1.id_1 = 0;
endmodule
