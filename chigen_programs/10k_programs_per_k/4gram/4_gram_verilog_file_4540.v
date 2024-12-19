// Seed: 201215332
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    output wor id_2,
    output wor id_3,
    input supply1 id_4,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    output tri0 id_8
);
  assign id_3 = id_1;
  wire id_10;
  module_2 modCall_1 (
      id_6,
      id_5,
      id_3,
      id_8,
      id_4
  );
endmodule
module module_1 (
    input tri1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output wand id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input  wand id_0,
    input  wire id_1,
    output tri  id_2,
    output tri  id_3,
    input  wire id_4
);
  uwire id_6;
  always #1 $display(1'h0, id_1, id_4 && id_6, id_6);
  wire id_7;
endmodule
