// Seed: 3235633188
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
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  ;
endmodule
module module_0 #(
    parameter id_6 = 32'd86
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    module_1,
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  output logic [7:0] id_14;
  inout wire id_13;
  output logic [7:0] id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire _id_6;
  output wire id_5;
  output reg id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_8,
      id_2,
      id_13,
      id_9,
      id_9,
      id_9,
      id_5,
      id_8
  );
  inout wire id_2;
  inout wire id_1;
  wire id_16;
  assign id_14[-1] = id_7;
  initial begin : LABEL_0
    id_12[id_6] <= {id_16{id_11 == id_2}};
    id_4 <= -1 ? id_7 : -1;
  end
endmodule
