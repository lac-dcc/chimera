// Seed: 1962054951
module module_0;
  tri1 id_2, id_3;
  id_4(
      -1, 1, id_2, this, -1 - -1, -1, 1'b0, id_2, id_1, -1'b0, 1'd0, id_3 - id_1, id_5, id_3, id_1
  );
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  always_comb $display(id_1);
  always @(posedge (1'b0))
    @(posedge id_1) begin : LABEL_0
      id_1 = 1;
      if (1) id_1 <= (1);
      else id_1 = id_1;
    end
  module_0 modCall_1 ();
  supply0 id_2 = -1;
endmodule
