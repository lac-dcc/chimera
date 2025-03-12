// Seed: 1036476805
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  logic id_3;
  ;
  assign id_3 = id_2;
endmodule
module module_1 #(
    parameter id_12 = 32'd63,
    parameter id_13 = 32'd35
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
    id_10
);
  output reg id_10;
  output wire id_9;
  input wire id_8;
  module_0 modCall_1 (
      id_6,
      id_6
  );
  output logic [7:0] id_7;
  inout uwire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input logic [7:0] id_2;
  inout logic [7:0] id_1;
  logic id_11;
  assign id_7 = id_11;
  wire _id_12;
  wire _id_13;
  assign id_7[-1] = id_2[-1-:id_12];
  always @(posedge id_1[id_13] or negedge -1) id_10 = id_8;
  assign id_6 = id_13 ? -1'b0 : id_8;
endmodule
