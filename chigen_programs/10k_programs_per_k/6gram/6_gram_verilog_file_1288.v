// Seed: 1674938661
module module_0 (
    input  tri   id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output wire  id_3,
    output uwire id_4
);
  wire id_6, id_7;
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    input wand id_4,
    output tri id_5,
    input uwire id_6,
    input wand id_7,
    input supply1 id_8
);
  assign id_5 = ~id_6 == id_3;
  assign id_5 = id_2;
  supply0 id_10;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_0,
      id_0
  );
  always @(posedge id_6) id_10 = id_4;
endmodule
