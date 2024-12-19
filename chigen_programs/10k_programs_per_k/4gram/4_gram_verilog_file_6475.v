// Seed: 2842522628
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  tri0 id_4;
  assign id_1 = id_4 * 1'b0 - id_4;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_4 = 0;
  reg id_6 = 'h0;
  initial begin : LABEL_0
    id_6 <= 1;
    if (1) id_4 <= 'b0;
  end
endmodule
