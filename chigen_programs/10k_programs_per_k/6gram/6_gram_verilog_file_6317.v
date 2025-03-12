// Seed: 1761827800
module module_0 (
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
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_12 = id_3;
  generate
    if (-1) begin : LABEL_0
      assign id_3 = id_15;
    end else begin : LABEL_1
      wire id_16 = id_12;
    end
  endgenerate
  wire id_17;
endmodule
module module_1 #(
    parameter id_1 = 32'd49,
    parameter id_2 = 32'd18
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output reg id_4;
  output wire id_3;
  inout wire _id_2;
  input wire _id_1;
  always @(posedge id_1) begin : LABEL_0
    id_4 <= id_2;
  end
  wire id_7;
  logic [id_1 : id_2] id_8;
  ;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_5,
      id_6,
      id_5,
      id_6,
      id_7,
      id_7,
      id_5,
      id_8,
      id_8,
      id_6,
      id_5,
      id_6,
      id_6
  );
endmodule
