// Seed: 1455516452
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  logic [7:0] id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  assign id_3 = 1;
  always begin : LABEL_0
    id_14 = id_8[1'h0];
    $display(1 - 1, 1'b0);
  end
  wire id_16;
  always assign id_12 = id_4 != 1'b0;
  logic [7:0] id_17 = id_15;
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7, id_8, id_9;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_8,
      id_9,
      id_9,
      id_4
  );
endmodule
