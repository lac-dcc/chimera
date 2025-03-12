// Seed: 859828492
module module_0 (
    input  uwire id_0,
    input  wand  id_1,
    input  uwire id_2,
    output wand  id_3,
    input  tri1  id_4
);
  assign id_3 = ~id_4;
  module_2 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_3,
      id_0,
      id_1
  );
endmodule
module module_1 (
    input  tri0  id_0,
    output uwire id_1,
    input  wor   id_2,
    input  wire  id_3,
    input  uwire id_4
);
  assign id_1 = -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
  wire id_6;
  logic id_7;
  logic [-1 'b0 : -1] id_8;
  parameter id_9 = -1;
endmodule
module module_2 (
    input supply1 id_0,
    output tri0 id_1,
    input tri id_2,
    output wire id_3,
    input tri0 id_4,
    input tri id_5
);
  assign id_3 = id_4;
  logic id_7;
  ;
  assign module_0.id_4 = 0;
endmodule
