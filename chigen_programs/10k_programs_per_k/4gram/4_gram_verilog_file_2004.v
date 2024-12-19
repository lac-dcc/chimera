// Seed: 973577570
module module_0;
  initial begin : LABEL_0
    id_1 <= 1;
    id_1 <= #1 "";
    id_1 <= {id_1, 1'b0};
    if (!id_1) id_1 -= 1;
  end
  generate
    assign id_2[1 : 1'b0==1] = id_2;
  endgenerate
  assign module_1.id_2 = 0;
endmodule
module module_1 ();
  module_0 modCall_1 ();
  reg id_1, id_2, id_3, id_4, id_5, id_6;
  always @(id_5) begin : LABEL_0
    id_2 = id_3;
    if (1'b0) begin : LABEL_0
      id_5 <= (id_1);
    end
  end
endmodule
