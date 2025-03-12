// Seed: 2062186633
module module_0 (
    input  tri1  id_0,
    input  tri1  id_1,
    input  wand  id_2,
    input  wor   id_3,
    input  wor   id_4,
    input  uwire id_5,
    output tri0  id_6
);
  wire id_8;
  assign module_1.id_2 = 0;
  logic id_9;
  ;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output logic id_3,
    input tri1 id_4,
    input tri1 id_5,
    output supply1 id_6,
    input supply0 id_7,
    input tri0 id_8
);
  assign id_3 = -1;
  xnor primCall (id_6, id_10, id_0, id_2, id_8, id_7, id_5, id_4);
  bit id_10;
  ;
  always #1 begin : LABEL_0
    id_10 = id_8 - id_10;
    #1;
    id_3 <= -1'b0;
  end
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_8,
      id_4,
      id_5,
      id_6
  );
endmodule
