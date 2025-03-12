// Seed: 3606283173
module module_0 (
    output wire id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    input  wand id_3,
    output wire id_4,
    input  tri0 id_5
);
  logic [7:0] id_7 = id_3;
  assign id_7[1] = id_1;
endmodule
module module_1 (
    input  wor id_0,
    output tri id_1
);
  assign id_1 = id_0#(.id_0(1 * 1 << 1));
  logic [7:0] id_3 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.id_5 = 0;
  assign #id_4 id_3[-1] = id_4;
endmodule
