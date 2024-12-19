// Seed: 2441766542
module module_0 ();
  always @(posedge id_1) begin : LABEL_0
    id_1 = 1;
  end
  always @(*) begin : LABEL_0
    id_1 <= 1;
    if (1'b0) disable id_2;
    else begin : LABEL_0
      id_1 <= 1;
    end
  end
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output wand id_2,
    output tri1 id_3
);
  always @(posedge id_0 or negedge 1'b0 - 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_3 = 1;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
