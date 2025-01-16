// Seed: 2786117247
module module_0 (
    output wand id_0
);
  id_2(
      .id_0(id_0),
      .id_1(-1'b0),
      .id_2(1),
      .id_3(),
      .id_4(id_0),
      .id_5(-1),
      .id_6(id_3),
      .id_7(-1'b0)
  );
endmodule
module module_1 (
    output tri0 id_0,
    inout  wand id_1,
    output wand id_2,
    input  tri0 id_3,
    output wire id_4
);
  assign id_0 = 1;
  always @(negedge id_1) begin : LABEL_0
    @(posedge 1) id_2 = id_3;
    $display(-1);
  end
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endmodule
