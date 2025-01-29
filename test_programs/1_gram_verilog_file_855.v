// Seed: 2763975916
module module_0 #(
    parameter id_21 = 32'd48
) (
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
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_7 = id_4;
  assign id_9 = id_4 ? id_4 : 1;
  wire id_17, id_18;
  wire id_19, id_20;
  defparam id_21 = id_15;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7 ((-1)),
        .id_8 (-1'b0),
        .id_9 (id_10),
        .id_11(-1),
        .id_12(id_9),
        .id_13(-1),
        .id_14(-1)
    ),
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_6,
      id_5,
      id_1,
      id_3,
      id_4,
      id_16,
      id_20,
      id_3,
      id_16,
      id_19,
      id_15,
      id_15,
      id_9,
      id_18
  );
endmodule
