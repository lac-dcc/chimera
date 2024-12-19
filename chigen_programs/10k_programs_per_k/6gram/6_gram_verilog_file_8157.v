// Seed: 1906124522
module module_0 (
    input  wor   id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  wand  id_3,
    output uwire id_4
);
  assign id_1 = ~id_0 & id_2;
  assign id_4 = 1;
  generate
    for (id_6 = 1'b0; id_2; id_1 = 1) begin : LABEL_0
      assign id_4 = $display(id_6);
    end
  endgenerate
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input wor id_2,
    inout supply1 id_3
);
  always @(posedge 1) begin : LABEL_0
    id_1 <= !id_3;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.type_1 = 0;
endmodule
