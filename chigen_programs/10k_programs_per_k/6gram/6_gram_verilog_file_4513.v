// Seed: 2811562243
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri0  id_2,
    output tri   id_3
);
  struct packed {
    id_5 id_6;
    logic [1 : -1] id_7;
  } id_8;
  ;
  wire \id_9 ;
  always @(1 == id_8.id_5 or posedge id_0) while (-1) id_8.id_6 = id_0;
endmodule
module module_1 (
    input  wor   id_0,
    output tri0  id_1,
    input  wand  id_2,
    output uwire id_3,
    input  wire  id_4,
    input  wire  id_5,
    output tri0  id_6,
    input  tri   id_7
);
  assign id_6 = id_7;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_1
  );
endmodule
