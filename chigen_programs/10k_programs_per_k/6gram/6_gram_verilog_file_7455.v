// Seed: 1837621165
module module_0;
  assign id_1 = 1'd0;
endmodule
module module_1 #(
    parameter id_18 = 32'd85,
    parameter id_19 = 32'd22
) (
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
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_17;
  xor primCall (id_1, id_10, id_12, id_13, id_15, id_16, id_17, id_3, id_4, id_5, id_6, id_8, id_9);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  defparam id_18.id_19 = 1;
  always @(posedge id_4 or posedge 1) begin : LABEL_0
    id_5 <= id_16;
  end
endmodule
