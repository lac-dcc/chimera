// Seed: 3496759616
module module_0 (
    output uwire id_0,
    output wor   id_1
);
  assign id_0 = 1;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    input supply1 id_5,
    output supply0 id_6,
    input wor id_7,
    input wor id_8,
    output tri1 id_9,
    input tri id_10,
    input wand id_11,
    input supply1 id_12,
    input wand id_13
);
  generate
    assign id_6 = 1 !== id_0 && 1 && id_5;
    always @(posedge 1) begin : LABEL_0
      return 1 == 1'b0;
    end
  endgenerate
  xnor primCall (id_9, id_5, id_13, id_7, id_0, id_1, id_3, id_11);
  module_0 modCall_1 (
      id_6,
      id_9
  );
  assign modCall_1.type_5 = 0;
endmodule
