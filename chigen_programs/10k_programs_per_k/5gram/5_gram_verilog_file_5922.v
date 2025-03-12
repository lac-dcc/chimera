// Seed: 2335211219
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
    id_15,
    id_16
);
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  logic id_17;
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_10,
      id_8,
      id_9,
      id_10,
      id_11,
      id_8,
      id_3,
      id_11,
      id_10,
      id_8,
      id_6,
      id_3,
      id_4,
      id_8
  );
  output wire id_2;
  inout wire id_1;
  assign id_10 = 1;
  wire id_12;
  wire id_13;
  localparam id_14 = 1;
  always @(id_14) begin : LABEL_0
    $signed(33);
    ;
    begin : LABEL_1
      #1;
    end
  end
endmodule
