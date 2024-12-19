// Seed: 1354014994
module module_0;
  assign id_1 = 1'b0;
  assign id_1 = 1;
  reg id_2, id_3;
  supply0 id_4;
  always begin : LABEL_0
    begin : LABEL_0
      id_3 <= {1, 1'h0, id_1};
      if ((1)) @(posedge 1 or id_2 ^ 1'b0, posedge id_4 - 1 or 1) id_3 <= 1;
      else
        fork
          #1 id_3 = 1;
          @(negedge 1 or 1 or id_2) $display;
        join_any
    end
  end : SymbolIdentifier
endmodule
module module_1 ();
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
