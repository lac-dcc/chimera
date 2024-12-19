// Seed: 642075374
module module_0;
  assign id_1 = 1;
endmodule
module module_0 #(
    parameter id_17 = 32'd1,
    parameter id_18 = 32'd61
) (
    id_1,
    id_2,
    id_3,
    module_1,
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
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_4[1] = id_9;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_6 = 1;
  wire id_15;
  wire id_16;
  defparam id_17.id_18 = 1;
  always @(posedge 1) begin : LABEL_0
    id_7 = 1;
  end
  xnor primCall (id_1, id_10, id_11, id_12, id_3, id_5, id_8, id_9);
  wire id_19;
  wire id_20;
endmodule
