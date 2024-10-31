// Seed: 2294238699
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri id_2,
    output uwire id_3#(.id_15(1)),
    output supply1 id_4,
    input wand id_5,
    input uwire id_6,
    input wire id_7,
    output uwire id_8,
    input tri1 id_9,
    output supply0 id_10,
    input supply1 id_11,
    input wire id_12,
    input supply1 id_13
);
  assign id_15 = 1'd0;
  supply0 id_16;
  pullup (id_7, id_8);
  assign id_8 = id_16 % 1'b0;
endmodule
module module_1 (
    input wor  id_0,
    input wire id_1
);
  assign id_3 = id_1;
  module_0(
      id_3, id_1, id_1, id_3, id_3, id_1, id_3, id_3, id_3, id_3, id_3, id_0, id_0, id_3
  );
endmodule
