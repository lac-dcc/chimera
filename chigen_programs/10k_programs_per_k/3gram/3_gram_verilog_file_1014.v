// Seed: 1133122140
module module_0 #(
    parameter id_13 = 32'd59,
    parameter id_14 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wor id_10 = $display(id_1 & 1);
  assign id_4 = id_5;
  initial begin : LABEL_0
    id_7 = 1;
  end
  assign id_2 = 1;
  wire id_11, id_12;
  defparam id_13.id_14 = id_10;
  wire id_15;
  wire id_16;
  wire id_17;
  assign id_8 = 1;
  wire id_18;
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
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_10,
      id_9,
      id_9,
      id_8,
      id_10,
      id_10,
      id_2
  );
endmodule
