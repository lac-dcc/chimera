// Seed: 632558235
module module_0 #(
    parameter id_13 = 32'd59
) (
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
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  assign id_3 = 1'b0;
  wand id_9, id_10, id_11;
  localparam id_12 = 1;
  defparam id_13 = -1 & -1;
  wire id_14;
  assign id_9  = id_6;
  assign id_10 = 1;
  assign id_4  = 1;
  initial id_9 = id_6;
  always begin : LABEL_0
    id_7 = -1;
  end
  wire id_15;
  wire id_16;
  wire id_17;
  wand id_18 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_3,
      id_4,
      id_4,
      id_3
  );
endmodule
