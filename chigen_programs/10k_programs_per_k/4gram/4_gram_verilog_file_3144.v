// Seed: 2171957454
module module_0;
  always @(negedge id_1)
    if (id_1)
      if (1) begin : LABEL_0
        begin : LABEL_0
          assume (1);
        end
      end else if (1'b0) begin : LABEL_0
        if (1) begin : LABEL_0
          id_1 <= 1;
        end
      end
endmodule
module module_1;
  string id_1 = id_1;
  logic [7:0] id_2 = id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_1 = id_2[1][1'b0];
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
