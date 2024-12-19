// Seed: 379474897
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
    id_17
);
  output wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_18, id_19;
  id_20 :
  assert property (@(1'b0) 1'b0)
  else;
  assign id_11 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd99,
    parameter id_11 = 32'd79,
    parameter id_12 = 32'd50,
    parameter id_2  = 32'd68,
    parameter id_8  = 32'd71,
    parameter id_9  = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire _id_2;
  inout wire id_1;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6,
      id_1,
      id_3,
      id_6,
      id_1,
      id_3,
      id_7,
      id_1,
      id_3,
      id_7,
      id_3
  );
  defparam id_8.id_9#(
      .id_10(1 / 1'b0),
      .id_11(1),
      .id_12(id_2)
  ) = 1;
  wire id_13;
endmodule
