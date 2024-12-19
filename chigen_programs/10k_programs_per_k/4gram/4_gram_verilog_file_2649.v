// Seed: 796792738
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri id_2,
    output wand id_3,
    output wire id_4
);
  assign id_4 = id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    output supply1 id_3,
    output tri id_4,
    output wor id_5
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_5
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2;
  wire id_2;
  logic [7:0] id_3;
  assign id_3[1'h0] = 1;
endmodule
