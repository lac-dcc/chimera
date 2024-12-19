// Seed: 4269891287
module module_0;
  always @(posedge 1'b0) begin : LABEL_0
    assume (1'h0) $display(1, 1);
    id_1 <= 1;
  end
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output wand  id_1,
    output wor   id_2
);
  id_4(
      .id_0(1), .id_1(1), .id_2(id_0), .id_3(1 | 1)
  );
  module_0 modCall_1 ();
endmodule
module module_2 (
    inout logic id_0,
    input supply0 id_1,
    input supply0 id_2,
    inout tri1 id_3,
    input wor id_4,
    input tri1 id_5,
    output tri0 id_6,
    input wor id_7,
    output wor id_8,
    output tri1 id_9
);
  always @(posedge 1) begin : LABEL_0
    id_0 <= 1;
  end
  module_0 modCall_1 ();
endmodule : SymbolIdentifier
