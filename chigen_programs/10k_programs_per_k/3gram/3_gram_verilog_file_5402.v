// Seed: 4171864722
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_2;
  always @(posedge 1'b0);
  initial begin : LABEL_0
    if (1 + id_1) begin : LABEL_0
      fork : SymbolIdentifier
        if (id_1 != 1) begin : LABEL_0$display
          ;
        end
        disable id_2;
      join
    end
    id_1 <= 1;
    $display(1, 1, id_1, id_1, id_1);
  end
  uwire id_3, id_4, id_5, id_6, id_7, id_8, id_9;
  assign id_3 = 1;
  wire id_10;
  module_0 modCall_1 (
      id_2,
      id_6
  );
endmodule
