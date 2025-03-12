// Seed: 1603690907
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wor id_2
);
  uwire id_4;
  assign module_2.id_4 = 0;
  generate
    if (1) begin : LABEL_0
      assign id_4 = -1 ? 1 : 1 ? 1 : 1;
    end
  endgenerate
endmodule
module module_1 (
    input  tri1 id_0,
    input  wire id_1,
    output tri0 id_2
);
  logic id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 #(
    parameter id_0 = 32'd44,
    parameter id_1 = 32'd94
) (
    input  tri  _id_0,
    input  tri1 _id_1,
    output tri1 id_2,
    output wor  id_3,
    input  wor  id_4
);
  wand [id_0 : id_1] id_6;
  assign id_6 = -1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
endmodule
