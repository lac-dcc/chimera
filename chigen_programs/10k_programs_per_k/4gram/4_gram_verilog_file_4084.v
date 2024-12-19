// Seed: 2304617480
module module_0 (
    output supply0 id_0,
    input tri id_1,
    input uwire id_2,
    input uwire id_3,
    input uwire id_4
);
  assign id_0 = id_4;
  assign module_1.type_9 = 0;
  always @(*) begin : LABEL_0
    if (id_1) begin : LABEL_0
      id_0 = 1 - id_2;
    end
  end
endmodule
module module_1 (
    output wand id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3,
    input tri0 id_4,
    input wire id_5,
    output supply0 id_6
);
  generate
    if (1) begin : LABEL_0
      assign id_6 = id_5;
    end
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_5
  );
endmodule
