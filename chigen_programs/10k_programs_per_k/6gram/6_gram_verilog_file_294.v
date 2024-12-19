// Seed: 1903858599
module module_0 (
    input tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    output wand id_3,
    output wor id_4,
    input tri id_5,
    output wand id_6,
    output supply1 id_7
);
  tri1 id_9 = 1'h0;
  assign module_1.id_0 = 0;
  wire id_10;
endmodule
module module_1 (
    output tri0 id_0,
    output wand id_1,
    input  tri0 id_2,
    input  tri1 id_3,
    input  wand id_4,
    output tri0 id_5
);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_1,
      id_0,
      id_3,
      id_5,
      id_5
  );
  wire id_7 = id_4 == id_2 ? 1 : id_4;
  reg id_8, id_9;
  always @(negedge "") begin : LABEL_0
    id_8 <= 1;
  end
endmodule
