// Seed: 407829043
module module_0 (
    output tri0 id_0,
    input  wand id_1,
    input  tri1 id_2,
    output wand id_3
);
  tri  id_5 = id_1;
  wire id_6;
  wire id_7;
  module_2 modCall_1 (
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
  assign module_1.id_0  = 0;
  wire id_8 = id_2;
endmodule
module module_1 (
    input  wire id_0,
    output tri1 id_1,
    output wire id_2
);
  always disable id_4;
  assign id_2 = 1;
  id_5(
      .id_0(1), .id_1(1), .id_2(1)
  );
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1
  );
endmodule
module module_2 (
    input  wire id_0,
    output tri1 id_1
);
  assign id_1 = (1) == id_0;
endmodule
