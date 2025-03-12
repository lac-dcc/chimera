// Seed: 3978196729
module module_0 (
    output tri  id_0,
    input  tri0 id_1,
    output tri1 id_2,
    input  tri  id_3
);
  union packed {
    logic id_5;
    logic id_6;
    logic id_7;
    logic [-1 : -1] id_8;
    logic id_9;
  } id_10;
  ;
  assign module_1.id_4 = 0;
  assign id_10.id_6 = id_10.id_7;
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    input  wor   id_3,
    input  tri0  id_4,
    output wor   id_5[1 : -1]
);
  assign id_5 = id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1
  );
endmodule
