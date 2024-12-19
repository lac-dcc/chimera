// Seed: 412847942
module module_0 (
    output tri  id_0,
    output wand id_1
);
  tri id_3 = 1;
endmodule
module module_1 (
    output wor   id_0,
    input  tri0  id_1,
    input  uwire id_2,
    output uwire id_3,
    output wire  id_4,
    output uwire id_5,
    output tri0  id_6,
    input  wor   id_7
);
  uwire id_9;
  int   id_10;
  module_0 modCall_1 (
      id_6,
      id_5
  );
  assign modCall_1.type_4 = 0;
  always @(posedge 1 or posedge 1'b0) id_9 = 1;
  always @(*) begin : LABEL_0
    if (id_9) id_10 <= {1'h0, 1, 1'b0};
  end
endmodule
