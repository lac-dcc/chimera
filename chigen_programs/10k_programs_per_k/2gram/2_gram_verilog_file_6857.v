// Seed: 3680431277
module module_0;
  assign id_1 = 1;
  uwire id_2, id_3 = 1, id_4, id_5 = 1, id_6, id_7, id_8, id_9;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1,
    output logic id_2
);
  assign id_2 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_1 = id_0;
  assign id_2 = id_0 + 1;
  always_comb begin : LABEL_0
    @(id_0) id_1 = id_0;
    id_2 <= "";
    id_2 <= (1);
    if (1) id_1 <= {1, id_0};
    disable id_4;
  end
endmodule
