// Seed: 545701669
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3
);
  assign id_5 = 1 ? id_2 == 1'h0 : 1;
  reg id_6 = 1;
  always @(posedge 1) begin : LABEL_0
    id_5 = id_5 - id_2;
    id_6 <= 1;
    id_5 <= 1 !=? 1'b0;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd71,
    parameter id_4 = 32'd80
) (
    output uwire id_0,
    input  wor   id_1
);
  defparam id_3.id_4 = id_3;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
