// Seed: 3461068009
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
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  output wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_19;
  wire id_20;
endmodule
module module_1 #(
    parameter id_3 = 32'd60,
    parameter id_4 = 32'd88
) (
    id_1
);
  input wire id_1;
  always begin : LABEL_0
    assume #1  (id_1);
    wait (1);
  end
  tri0 id_2;
  assign id_2 = id_1;
  defparam id_3.id_4 = (1);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1
  );
  wand id_5 = id_4;
endmodule
