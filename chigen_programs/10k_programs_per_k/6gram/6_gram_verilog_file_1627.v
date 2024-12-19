// Seed: 3178456726
module module_0 ();
  tri1 id_1;
  assign module_1.id_3 = 0;
  wor id_2;
  generate
    for (id_3 = 1; 1 < id_3; id_2 = 1) begin : LABEL_0
      always @(1 or posedge 1) begin : LABEL_0
        id_1 = id_2;
      end
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_1[1];
  reg id_3;
  always @(posedge 1'b0 or negedge id_2) begin : LABEL_0
    id_3 <= 1'b0;
  end
  module_0 modCall_1 ();
endmodule
