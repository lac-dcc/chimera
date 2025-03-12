// Seed: 2562472965
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
    id_12
);
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  assign id_12 = 1;
  wire id_14, id_15, id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23;
  wire id_24;
  wire id_25;
  localparam id_26 = 1;
  wire id_27;
  wire id_28;
  initial
    @(id_24 or id_14) begin : LABEL_0
      if (1'b0) assert (id_26);
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3
  );
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_8;
  wire id_9;
endmodule
