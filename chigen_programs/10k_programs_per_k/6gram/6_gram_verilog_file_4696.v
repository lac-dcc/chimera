// Seed: 3528610283
module module_1 (
    input wand id_0,
    input tri1 id_1,
    output tri0 id_2,
    input uwire id_3,
    input wand id_4,
    input wand id_5,
    input wor id_6,
    input wire id_7,
    input supply0 id_8,
    input wire module_0
);
  always @(posedge 1'd0) if (id_3) id_2 = 1;
endmodule
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input supply0 id_3,
    input wor module_1,
    input wand id_5,
    output supply1 id_6,
    output uwire id_7,
    output supply1 id_8
);
  wire id_10;
  module_0(
      id_2, id_1, id_0, id_2, id_5, id_2, id_5, id_1, id_2, id_3
  );
  assign id_8 = id_2;
  assign id_8 = id_1;
endmodule
