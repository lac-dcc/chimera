// Seed: 2601431760
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  module_2 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7
  );
  generate
    `undef pp_8
  endgenerate
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = id_2(1 - id_1 == "", 1, 1);
  always_comb @(1) begin : LABEL_0
    id_3 = ~id_2;
  end
endmodule
