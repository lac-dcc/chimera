// Seed: 1799551319
module module_0;
  assign id_1 = !id_1 <= 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_6 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always
  fork : SymbolIdentifier
    id_3 <= id_6;
    begin : LABEL_0
      if (1) $display(1);
    end
    #1 begin : LABEL_0$display
      ;
    end
  join : SymbolIdentifier
  always @(posedge 1) begin : LABEL_0
    id_5 += id_5;
  end
endmodule
