// Seed: 2445695329
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output tri0 id_2,
    input tri id_3,
    input supply0 id_4,
    input wand id_5,
    output tri1 id_6,
    input wire id_7
);
  assign id_6 = 1'b0;
  logic id_9;
  logic id_10, id_11;
endmodule
module module_1 (
    input  tri1 id_0,
    input  tri1 id_1,
    input  wire id_2,
    input  tri1 id_3,
    input  wand id_4,
    output tri0 id_5,
    input  wand id_6
);
  logic id_8 = id_3 ? -1 : id_4;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
