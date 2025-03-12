// Seed: 3831840023
module module_0 (
    input uwire id_0,
    input tri0  id_1
);
  wire id_3;
  bit [-1 : -1] id_4;
  generate
    always_ff @* begin : LABEL_0
      id_4 = -1;
    end
  endgenerate
  logic id_5;
endmodule
module module_1 (
    output tri   id_0,
    output tri   id_1,
    output uwire id_2,
    input  tri1  id_3,
    output tri   id_4,
    input  tri   id_5
);
  assign id_0 = 1'b0 ? -1 : -1 ? id_3 : -1;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
