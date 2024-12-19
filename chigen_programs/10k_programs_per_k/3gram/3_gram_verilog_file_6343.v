// Seed: 3638834096
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = id_2;
  tri id_6;
  assign id_4 = 1'b0;
  generate
    always_latch @(id_2) begin : LABEL_0
      `define pp_7 0
      id_6 = 1;
    end
  endgenerate
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_2,
      id_4
  );
endmodule
