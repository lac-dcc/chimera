// Seed: 2636543043
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output uwire id_6
);
  final $display(1'b0);
  wire  id_8;
  tri1  id_9;
  uwire id_10;
  always @(posedge 1) begin : LABEL_0
    id_9 = id_0;
    id_6 = 1;
    assert (1 ^ 1);
    id_10 = 1;
  end
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    input  tri0  id_0,
    output wor   id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  tri0  id_4,
    input  wand  id_5
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_1
  );
endmodule
