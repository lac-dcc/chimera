// Seed: 1723664471
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    output tri id_2,
    output uwire id_3,
    input supply0 id_4,
    input supply1 id_5,
    input tri id_6,
    input uwire id_7,
    output tri0 id_8
);
  logic id_10;
  ;
  wire id_11;
  assign id_11 = id_7;
  logic [1 : -1] id_12;
  ;
  assign id_3 = 1;
endmodule
module module_1 (
    input tri0 id_0#(.id_10(-1)),
    output uwire id_1,
    output supply0 id_2,
    input wire id_3,
    input wand id_4,
    input wand id_5,
    input tri1 id_6,
    input supply0 id_7,
    input wor id_8
);
  assign id_1 = -1'b0;
  and primCall (id_1, id_7, id_0, id_5, id_8, id_4, id_6, id_3);
  module_0 modCall_1 (
      id_6,
      id_2,
      id_1,
      id_1,
      id_4,
      id_5,
      id_6,
      id_4,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire [1 : 1 'd0] id_11;
endmodule
