// Seed: 3933733427
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output supply0 id_2,
    input tri1 id_3,
    input wire id_4,
    input uwire id_5,
    input wand id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri1 id_9,
    output supply1 id_10
);
  wire id_12;
  wire id_13;
  wire id_14 = 1;
  wire id_15;
  assign id_9 = id_8;
endmodule
module module_1 (
    input  wand id_0,
    input  wor  id_1,
    output tri1 id_2
);
  logic [7:0] id_4;
  assign id_4[1] = 1'b0;
  always @(id_4) id_2 = id_0;
  module_0(
      id_1, id_0, id_2, id_1, id_1, id_1, id_1, id_1, id_1, id_2, id_2
  );
endmodule
