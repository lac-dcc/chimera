// Seed: 3809915762
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  static reg id_8 = 1 == id_7;
  assign id_3 = 1;
  assign module_1.id_7 = 0;
  wire id_9;
  wire id_10;
  wire id_11;
  assign id_11 = 1;
  always @(1 or negedge id_8) begin : LABEL_0
    id_8 <= id_6[1];
  end
  wand id_12 = 1'b0;
  wire id_13;
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
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13;
  logic [7:0] id_14;
  module_0 modCall_1 (
      id_8,
      id_13,
      id_13,
      id_7,
      id_5,
      id_14,
      id_11
  );
  assign id_14[""] = id_6[1==1];
  assign id_14 = id_4;
  wire id_15;
endmodule
