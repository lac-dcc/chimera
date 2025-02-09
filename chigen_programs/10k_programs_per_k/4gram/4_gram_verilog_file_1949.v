// Seed: 839807026
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    input wire id_2,
    output tri0 id_3,
    input supply0 id_4
);
  assign id_3 = id_4;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input wire id_3,
    output tri1 id_4
);
  wand id_6 = id_6 - 1 ? 1 : id_3;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_3,
      id_6,
      id_1
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2;
  wor   id_1;
  uwire id_2;
  assign id_1 = id_1 === id_2;
  assign module_0.type_2 = 0;
  assign id_2 = id_1 ? 1 < 1'd0 : 1;
endmodule
