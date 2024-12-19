// Seed: 2123207166
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
    id_18,
    id_19,
    id_20,
    id_21
);
  input wire id_21;
  inout wire id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_16[1'd0] = 1;
  assign id_15 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd35,
    parameter id_7 = 32'd86
) (
    input  tri1 id_0,
    input  wor  id_1,
    output tri  id_2
);
  wire id_4;
  logic [7:0] id_5;
  defparam id_6.id_7 = id_6;
  always if (id_0) id_5[1] <= ~1'b0;
  id_8(
      .id_0(1'b0), .id_1(id_5)
  );
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_9,
      id_9,
      id_4,
      id_4,
      id_4,
      id_9,
      id_4,
      id_4,
      id_9,
      id_9,
      id_9,
      id_4,
      id_4,
      id_5,
      id_9,
      id_9,
      id_9,
      id_4,
      id_9
  );
endmodule
