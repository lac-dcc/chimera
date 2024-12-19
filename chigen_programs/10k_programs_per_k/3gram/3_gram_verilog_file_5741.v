// Seed: 2185457616
module module_0 (
    output tri id_0
);
endmodule
module module_1 (
    output wand id_0
    , id_11,
    input supply0 id_1,
    input supply1 id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    input supply1 id_6,
    input supply0 id_7,
    inout logic id_8,
    input supply1 id_9
);
  assign id_0 = id_6 + id_8;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
  tri id_12 = id_1;
  always @(1, id_11) begin : LABEL_0
    id_8 <= ~1'b0 - {id_12, id_5};
    id_11 = 1;
  end
endmodule
