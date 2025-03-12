// Seed: 2464917975
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
    id_10
);
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wor id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6 = -1;
  assign id_3 = id_8;
  assign id_7 = id_6;
endmodule
module module_1 #(
    parameter id_10 = 32'd28,
    parameter id_5  = 32'd41,
    parameter id_7  = 32'd46
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13#(-1, -1),
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_8,
      id_8,
      id_4,
      id_8,
      id_15,
      id_15,
      id_15,
      id_1
  );
  input wire id_13;
  output wire id_12;
  inout logic [7:0] id_11;
  input wire _id_10;
  output wire id_9;
  inout wire id_8;
  input wire _id_7;
  inout reg id_6;
  input wire _id_5;
  input wire id_4;
  output wire id_3;
  output tri id_2;
  input wire id_1;
  always_comb @(id_15 or negedge "" & id_8 & id_11[-1 : id_10]) begin : LABEL_0
    id_6 <= -1'b0;
  end
  assign id_2 = id_8;
  always begin : LABEL_1
    id_6 <= 1;
  end
  assign id_2 = id_4 * id_11;
  wire id_16;
  struct packed {logic ["" : id_7] id_17;} [id_5 : 1 'b0] id_18;
endmodule
