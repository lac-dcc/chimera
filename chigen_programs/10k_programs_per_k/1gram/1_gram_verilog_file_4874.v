// Seed: 1376680020
module static module_0 (
    input supply1 id_0,
    input tri1 id_1
);
  wire id_3;
  assign id_3 = id_0;
  logic id_4;
  assign module_1.id_1 = 0;
  wire id_5;
  wire id_6;
  ;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri   id_1,
    input  wand  id_2
    , id_6 = 1,
    output uwire id_3,
    output wand  id_4
);
  always_ff begin : LABEL_0
    force id_4 = 1;
  end
  assign id_3 = id_2;
  assign id_4 = id_1;
  module_0 modCall_1 (
      id_2,
      id_0
  );
endmodule
module module_2 (
    input  uwire id_0,
    output tri0  id_1,
    output uwire id_2,
    input  tri   id_3,
    output wor   id_4,
    input  tri   id_5
);
  union packed {
    id_7 id_8;
    logic id_9;
    integer id_10;
  } id_11 = id_11.id_9;
  module_0 modCall_1 (
      id_0,
      id_5
  );
  wire id_12;
  assign id_2 = id_11.id_8 ? id_3 : 1'b0;
  assign id_11.id_10 = 1'b0;
endmodule
