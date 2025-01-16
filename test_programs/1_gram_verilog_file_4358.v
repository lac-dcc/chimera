// Seed: 977875261
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    input tri1 id_5,
    input tri0 id_6,
    output wire id_7,
    input wor id_8
);
  wire id_10 = id_0 && -1;
  if (id_1) begin : LABEL_0
    supply0 id_11 = 1 - id_8;
  end else begin : LABEL_0
    assign id_7 = id_0;
  end
  wire id_12;
  wire id_13;
  wire id_14, id_15;
  assign id_10 = 1'b0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    input  wand  id_2,
    output tri1  id_3,
    input  wand  id_4,
    input  wor   id_5,
    input  tri1  id_6
);
  bit id_8, id_9;
  assign id_8 = -1'd0;
  always id_8 <= 1;
  xnor primCall (id_3, id_0, id_8, id_6, id_2, id_5, id_4, id_9);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_0,
      id_5,
      id_5,
      id_6,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
