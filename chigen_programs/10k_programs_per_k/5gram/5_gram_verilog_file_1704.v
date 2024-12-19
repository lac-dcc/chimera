// Seed: 846180157
module module_0;
  wire id_2;
endmodule
module module_1 (
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
    id_12
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_13;
  always_comb @(1'b0 - 1 or posedge 1) begin : LABEL_0
    id_5  <= id_4;
    id_12 <= {id_4, 1, 1 == id_3};
  end
  logic [7:0] id_14;
  assign id_14[1] = 1'b0;
  assign id_13 = !id_10;
  xor primCall (id_1, id_10, id_11, id_13, id_14, id_15, id_2, id_3, id_4, id_5, id_6, id_7, id_8);
  wire id_15;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_16;
  wire id_17;
endmodule
