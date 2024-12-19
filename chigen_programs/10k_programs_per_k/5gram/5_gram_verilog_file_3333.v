// Seed: 1620345606
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
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wor id_16;
  assign id_16 = 1'd0;
  uwire id_17 = 1;
  logic [7:0] id_18;
  generate
    if (~id_7) begin : LABEL_0
      assign id_18[1] = 1'b0;
    end else begin : LABEL_0
      assign id_13 = 1;
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_2,
      id_2,
      id_4,
      id_5,
      id_5,
      id_3,
      id_4,
      id_5,
      id_4,
      id_2,
      id_4,
      id_4
  );
  assign id_1 = (id_6);
  wor id_7 = id_3;
endmodule
