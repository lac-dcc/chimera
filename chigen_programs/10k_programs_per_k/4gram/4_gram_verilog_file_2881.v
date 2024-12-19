// Seed: 1308526836
module module_0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_3;
  wand id_4;
  assign id_4 = id_1;
  always @(posedge id_2 or id_1 - id_4) begin : LABEL_0
    id_2 = id_4;
  end
  uwire id_5 = id_1;
  id_6(
      .id_0(), .id_1(id_4), .id_2(1)
  );
  wand id_7;
  assign id_7 = 1'b0;
  tri1 id_8;
  tri0 id_9 = 1'h0;
  assign id_9 = id_2;
  module_0 modCall_1 ();
  always @(posedge id_5++ - (1'd0) && 1'h0 && 1) $display(id_7 || 1'h0, 1, id_3);
  initial begin : LABEL_0
    id_8 = id_4;
  end
endmodule
