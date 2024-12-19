// Seed: 2887079016
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    input  wire  id_2,
    input  tri   id_3,
    output tri   id_4
);
  wire id_6;
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    input tri0 id_2,
    input uwire id_3,
    input uwire id_4,
    input supply0 id_5,
    input wire id_6,
    output wand id_7,
    output uwire id_8,
    input wand id_9,
    output supply1 id_10
);
  tri0 id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_1
  );
  assign modCall_1.type_0 = 0;
  if (1'b0) begin : LABEL_0
    assign id_12 = id_12;
  end
  assign id_1 = 1 | {id_3 == !1'b0, id_12 === id_4};
endmodule
