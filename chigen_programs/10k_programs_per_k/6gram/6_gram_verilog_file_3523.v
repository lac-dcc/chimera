// Seed: 3274711717
module module_0 (
    input  supply0 id_0,
    output supply0 id_1,
    output supply1 id_2
);
  wire id_4, id_5;
  logic [7:0] id_6;
  assign id_1 = 1'b0;
  logic [7:0] id_7;
  wire id_8;
  assign id_7 = id_6;
  assign id_6[1'd0] = 1 - 1;
endmodule
module module_1 (
    output tri0 id_0,
    output wand id_1,
    input uwire id_2,
    output tri0 id_3,
    input supply0 id_4,
    output wor id_5
);
  assign id_3 = 1;
  buf (id_0, id_4);
  module_0(
      id_2, id_0, id_0
  );
endmodule
