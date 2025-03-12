// Seed: 1552188794
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8#(.id_9(-1)),
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_15 = 1;
  assign id_14 = id_3;
endmodule
module module_1 #(
    parameter id_15 = 32'd81
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
    id_12
);
  output wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always
    if (-1'b0) begin : LABEL_0
      #(-1 + 1);
    end else begin : LABEL_1
      wait (-1);
    end
  wire id_13;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_8,
      id_3,
      id_12,
      id_13,
      id_7,
      id_13,
      id_12,
      id_8,
      id_2,
      id_1,
      id_2
  );
  id_14(
      id_8
  );
  logic _id_15;
  xnor primCall (id_2, id_13, id_3, id_9, id_4, id_8, id_5, id_11, id_7);
  wire id_16;
  assign id_14[-1-id_15] = 1;
  wire [-1 : -1] id_17;
endmodule
