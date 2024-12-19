// Seed: 2258463836
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output wire id_2,
    input supply0 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input uwire id_6,
    input uwire id_7,
    output wor id_8,
    input tri0 id_9,
    input tri1 id_10,
    output wand id_11
);
  assign id_11 = id_3 == id_4;
  assign id_2  = id_7;
  wire id_13;
  assign id_11 = id_7;
  always @(posedge id_1 or posedge id_1 ~^ id_1) $display(1'b0 - 1, 1);
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    input  wand  id_2
);
  wand id_4;
  wire id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_2 = 0;
  wire id_6;
  always @(1) release id_6;
endmodule
