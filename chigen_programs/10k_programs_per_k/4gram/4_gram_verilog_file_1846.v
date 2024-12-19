// Seed: 1276312442
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    output tri id_3,
    input tri id_4,
    input uwire id_5,
    output tri0 id_6,
    output supply1 id_7
);
  id_9(
      .id_0(id_4), .id_1(id_3)
  );
  always @(posedge 1) begin : LABEL_0
    assume (1'h0 * $display(1) - 1);
  end
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    output wor id_2,
    input wand id_3,
    output supply1 id_4,
    output wand id_5,
    input wire id_6
);
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_3,
      id_0,
      id_5,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
