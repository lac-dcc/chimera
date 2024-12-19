// Seed: 1486884501
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output tri id_5,
    input wand id_6,
    input uwire id_7,
    input supply0 id_8,
    output tri id_9,
    output wand id_10
);
  assign id_5 = id_6 - 1'b0;
  assign id_9 = id_2;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input supply0 id_2,
    output tri1 id_3,
    output wire id_4
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_0,
      id_0,
      id_1,
      id_4,
      id_4
  );
  assign modCall_1.id_5 = 0;
  wire id_6, id_7;
endmodule
