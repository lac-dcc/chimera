// Seed: 848599720
module module_0;
  task id_3;
    fork : SymbolIdentifier
      $display(1, id_1, 'b0);
      id_4();
    join : SymbolIdentifier
  endtask
  assign module_1.SymbolIdentifier.SymbolIdentifier.id_4 = 0;
  assign id_1 = id_4;
  assign id_4 = 1 + id_3;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1
);
  initial begin : LABEL_0
    if (1'b0)
      if (1'b0) begin : LABEL_0
        if (1) begin : LABEL_0
          id_1 <= id_3;
        end
      end else if (id_4) id_0 <= 1;
  end
  module_0 modCall_1 ();
endmodule
