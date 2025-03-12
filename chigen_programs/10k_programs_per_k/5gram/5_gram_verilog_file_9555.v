// Seed: 3513873214
module module_0 #(
    parameter id_1 = 32'd75
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire _id_1;
  logic [id_1 : id_1] id_8;
endmodule
module module_1 #(
    parameter id_14 = 32'd52,
    parameter id_9  = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  input wire _id_9;
  inout logic [7:0] id_8;
  input wire id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  localparam id_14 = -1'b0;
  logic id_15;
  assign id_15 = id_14 ==? -1'b0;
  assign id_5[id_9] = 1;
  assign id_6 = id_3;
  assign id_4 = id_2;
  always @(*) id_8[-1 :-1'h0==-1] <= -1 == id_7 - -1;
  defparam id_14.id_14 = id_14, id_14.id_14 = id_14, id_14.id_14 = 1, id_14.id_14 = -1;
  module_0 modCall_1 (
      id_14,
      id_6,
      id_4,
      id_6,
      id_15,
      id_15,
      id_12
  );
  assign id_8 = id_6;
endmodule
