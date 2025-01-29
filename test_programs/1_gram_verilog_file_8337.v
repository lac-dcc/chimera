// Seed: 3942666229
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9#(.id_10(-1)),
    id_11,
    id_12,
    id_13
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always_ff id_6 = id_2;
  wire id_14, id_15, id_16;
  assign id_12 = id_2;
  assign id_6  = -1;
  wire id_17;
  assign id_12 = -1;
  assign id_13 = id_10 - id_12;
  assign id_11 = 1;
  assign id_14 = id_3;
  assign id_1  = id_12;
  wire id_18, id_19;
  wire id_20;
  initial
    @(posedge 1'd0) begin : LABEL_0
      begin : LABEL_0
        id_12 = id_12 * 1'h0;
      end
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(-1'b0 or id_1 or 1) id_3 <= id_1;
  assign id_3 = id_3;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_5,
      id_5,
      id_4,
      id_6,
      id_6,
      id_4
  );
  assign id_3 = id_1;
endmodule
