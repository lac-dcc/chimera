// Seed: 1819205372
module module_0 (
    input wand id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wor id_3
    , id_11,
    output supply1 id_4,
    output tri1 id_5,
    input supply0 id_6,
    output wire id_7,
    output tri0 id_8,
    output tri1 id_9
);
  reg id_12;
  assign id_5 = id_6 ? 1 : 1;
  always @(posedge 1'b0 or posedge 1) begin : LABEL_0
    id_12 <= 1'd0 ? 1 * id_2 - $display : 1;
    if (id_2) begin : LABEL_0
      id_8 = 1;
    end
  end
  id_13(
      .id_0(id_1), .id_1(id_12)
  );
endmodule
module module_1 (
    input  tri0  id_0,
    output wand  id_1
    , id_13,
    input  uwire id_2,
    output wor   id_3,
    output wand  id_4,
    input  tri1  id_5,
    output tri1  id_6,
    input  tri0  id_7,
    output tri0  id_8,
    input  tri0  id_9,
    output wor   id_10,
    input  tri   id_11
);
  initial begin : LABEL_0
    if (1'b0) begin : LABEL_0
      id_4 = 1;
    end
  end
  wire id_14;
  module_0 modCall_1 (
      id_2,
      id_10,
      id_5,
      id_9,
      id_8,
      id_8,
      id_11,
      id_8,
      id_4,
      id_3
  );
  assign modCall_1.type_18 = 0;
  assign id_6 = 1;
endmodule
