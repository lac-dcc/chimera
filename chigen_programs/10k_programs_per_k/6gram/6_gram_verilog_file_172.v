// Seed: 2077277941
module module_0 (
    output tri0  id_0,
    input  tri   id_1,
    output uwire id_2,
    output wire  id_3,
    output wire  id_4,
    output uwire id_5,
    input  wor   id_6
);
  struct packed {
    logic [-1 : (  1  )  ==  1] id_8;
    id_9 id_10;
  } id_11;
  assign id_11.id_9 = 1;
  logic id_12;
  ;
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    input tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    input supply1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    output supply1 id_9,
    output tri1 id_10,
    output supply0 id_11
);
  assign id_9 = id_5 | -1 | id_6;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_8,
      id_1,
      id_11,
      id_5
  );
  assign modCall_1.id_11.id_9 = 0;
endmodule
