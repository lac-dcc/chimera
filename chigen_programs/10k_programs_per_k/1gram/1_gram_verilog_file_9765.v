// Seed: 839193907
module module_0 #(
    parameter id_4 = 32'd93
) ();
  wire id_1, id_2, id_3, _id_4, id_5;
  wire id_6, id_7, id_8[-1 : id_4];
  union packed {
    logic id_9;
    logic id_10;
  }
      id_11, id_12 = id_1;
  rpmos (-1'b0 ? -1 && id_1 : 1, -1);
  assign id_6 = id_11.sum;
  if (1) begin : LABEL_0
    wire id_13, id_14, id_15, id_16, id_17, id_18;
    `undef pp_19
  end else begin : LABEL_1
    assign id_11.id_10 = 1;
  end
  assign id_5 = id_7;
  wire id_20 = id_11.id_9[-1'b0][id_4];
  parameter id_21 = 1;
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
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  module_0 modCall_1 ();
  assign modCall_1.id_11.id_10 = 0;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
