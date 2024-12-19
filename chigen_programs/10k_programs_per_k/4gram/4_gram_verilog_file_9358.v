// Seed: 3006056498
module module_0 (
    output tri   id_0,
    output wire  id_1,
    output uwire id_2,
    input  uwire id_3,
    input  wire  id_4,
    input  uwire id_5,
    output uwire id_6,
    output wand  id_7
);
  wire id_9;
  wire id_10;
  assign module_1.type_11 = 0;
  assign id_7 = id_3;
  always @(posedge id_5 | 1) begin : LABEL_0
    id_7 = (1);
  end
  wire id_11;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    input  tri1  id_2
);
  tri0  id_4;
  reg   id_5;
  uwire id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_1,
      id_2,
      id_4,
      id_4,
      id_4
  );
  wire id_7 = 1'd0;
  wire id_8;
  always @(posedge 1) id_5 <= 1;
  assign id_0 = id_4;
endmodule
