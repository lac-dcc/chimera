// Seed: 3169572539
module module_0;
  reg id_1;
  generate
    always_comb @(negedge id_1 or id_1) id_1 <= 1'd0;
  endgenerate
  module_2 modCall_1 ();
  wire id_3;
  wire id_4 = id_4;
  wire id_5;
  wire id_6;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 ();
endmodule
module module_2;
  assign id_1 = 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(1) begin : LABEL_0
    if (id_4) begin : LABEL_0
      return 1;
    end
  end
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
