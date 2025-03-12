// Seed: 3227937872
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
    id_11
);
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire ["" : 1 'b0] id_12;
endmodule
module module_1 #(
    parameter id_13 = 32'd77
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
    _id_13,
    id_14
);
  input wire id_14;
  inout wire _id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_8,
      id_3,
      id_12,
      id_14,
      id_9,
      id_9,
      id_4,
      id_8,
      id_5
  );
  inout wire id_8;
  output logic [7:0] id_7;
  input wire id_6;
  output wire id_5;
  inout supply0 id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = 1;
  assign id_1 = (id_10);
  initial begin : LABEL_0
    id_7[id_13] <= #1 -1;
  end
  wire id_15;
endmodule
