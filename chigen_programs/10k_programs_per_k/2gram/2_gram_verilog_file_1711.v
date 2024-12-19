// Seed: 378761927
module module_0;
  always @(id_1 or posedge 1) begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_1 = 1;
    end
  end
  assign module_1.type_1 = 0;
  wire id_2;
endmodule
module module_1 (
    output tri   id_0,
    output tri0  id_1,
    input  uwire id_2,
    output wor   id_3,
    input  tri1  id_4,
    output tri   id_5,
    output uwire id_6,
    input  wand  id_7
);
  id_9(
      .id_0(1'd0), .id_1(1)
  );
  nor primCall (id_0, id_10, id_11, id_2, id_4, id_7, id_9);
  wire id_10;
  reg  id_11;
  module_0 modCall_1 ();
  always_ff begin : LABEL_0
    id_11 <= {1, 1'd0};
  end
endmodule
