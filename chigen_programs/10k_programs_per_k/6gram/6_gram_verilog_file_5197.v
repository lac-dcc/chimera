// Seed: 1223040040
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output uwire id_7,
    input wor id_8,
    input wor id_9,
    input tri1 id_10,
    input tri1 id_11,
    output wand id_12
);
  generate
    assign id_7 = 1;
    if (1) begin : LABEL_0
      always @(1) force id_12 = 1;
    end else begin : LABEL_0
      genvar id_14;
      assign id_12 = 1;
    end
  endgenerate
endmodule
module module_1 (
    input  wor  id_0,
    output wand id_1,
    input  tri0 id_2,
    input  tri  id_3,
    input  tri0 id_4
);
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_4,
      id_1,
      id_2,
      id_3,
      id_4,
      id_0,
      id_1
  );
  assign modCall_1.type_8 = 0;
  tri0 id_7 = !1 ? 1 : 1;
  xnor primCall (id_1, id_2, id_3, id_0, id_6, id_4);
endmodule
