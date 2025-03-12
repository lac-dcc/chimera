// Seed: 2562306392
macromodule module_0 (
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
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output supply0 id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @*;
  assign id_13 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd39,
    parameter id_3 = 32'd12
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output reg id_5;
  output wire id_4;
  inout wire _id_3;
  input wire id_2;
  input wire _id_1;
  initial id_5 = 1'h0;
  logic [id_3 : id_1] id_7;
  always @(*) id_5 <= -1'b0;
  wire id_8;
  static reg id_9;
  for (id_10 = 1'b0; id_7; id_9 = id_6) begin : LABEL_0
    assign id_4 = id_1;
    assign id_4 = $realtime;
  end
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_10,
      id_8,
      id_8,
      id_7,
      id_8,
      id_8,
      id_10,
      id_10,
      id_7,
      id_7,
      id_8,
      id_4,
      id_7,
      id_10
  );
endmodule
