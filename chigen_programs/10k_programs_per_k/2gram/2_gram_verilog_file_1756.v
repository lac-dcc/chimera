// Seed: 3140074628
module module_0 (
    input tri0 id_0
);
  always begin : LABEL_0
    @(posedge 1) begin : LABEL_0
      if (id_0 & 1) id_2 <= 1'd0;
    end
  end
  always #1;
  assign id_3 = id_0 << 1;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input tri id_2,
    output wire id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    input tri id_7,
    input wire id_8,
    input supply0 id_9,
    output uwire id_10,
    input uwire id_11,
    output uwire id_12,
    input wor id_13,
    output wor id_14
);
  integer id_16;
  module_0 modCall_1 (id_9);
  assign modCall_1.type_0 = 0;
endmodule
