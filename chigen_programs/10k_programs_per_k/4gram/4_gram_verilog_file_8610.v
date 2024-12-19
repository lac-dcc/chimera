// Seed: 759262599
module module_0;
  always_latch @* begin : LABEL_0
    if ("" == 1) id_1 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  supply1 id_3;
  assign id_1 = 1'd0;
  wire id_4 = 1'h0;
  wire id_5, id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  initial
  fork : SymbolIdentifier
  join : SymbolIdentifier
  for (id_7 = 1; 1; id_2 = id_5) begin : LABEL_0
    wire id_8;
  end
  wire id_9;
  assign id_4 = 1;
  integer id_10 = 1;
  wire id_11;
  id_12(
      1, 1, id_3, 1'd0 == id_7
  );
  assign id_1 = 1;
  id_13(
      .id_0(1'd0), .id_1(!id_10), .product(1), .id_2(1'b0)
  );
  always @(posedge id_4 or 1'b0) id_11 = id_7++;
  wire id_14;
endmodule
