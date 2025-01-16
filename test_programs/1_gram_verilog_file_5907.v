// Seed: 3009400439
program module_0;
  assign id_1 = -1;
  assign id_2 = id_1;
  module_2 modCall_1 ();
endmodule
module module_1;
  always id_1 <= this;
  assign id_2 = -1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 ();
  reg id_1, id_2;
  always @(posedge 1'h0) begin : LABEL_0
    id_1 <= 1'd0;
  end
  wire id_6 = id_4;
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
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_16 = -1;
  module_2 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
