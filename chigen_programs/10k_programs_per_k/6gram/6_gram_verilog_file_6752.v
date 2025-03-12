// Seed: 1221197372
module module_0 #(
    parameter id_4 = 32'd0,
    parameter id_5 = 32'd35
) (
    id_1,
    id_2
);
  output logic [7:0] id_2;
  input wire id_1;
  assign id_2[1] = id_1 - 1;
  logic [7:0] id_3, _id_4;
  generate
    if (1) begin : LABEL_0
      wire _id_5;
      assign id_3[id_5==id_4] = 1'b0;
      wire id_6;
    end
  endgenerate
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
  input wire id_12;
  module_0 modCall_1 (
      id_11,
      id_3
  );
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  input wire id_1;
  logic id_13 = id_13;
  assign id_13[1]   = "";
  assign id_3[1'b0] = id_5 ? id_5 : 1 ? 1 : -1;
  wire  id_14;
  logic id_15;
endmodule
