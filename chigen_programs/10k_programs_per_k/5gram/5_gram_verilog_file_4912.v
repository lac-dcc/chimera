// Seed: 3106815173
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
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output logic [7:0] id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  logic id_12;
  wire  id_13;
  assign id_8 = id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd9
) (
    _id_1,
    id_2
);
  output wire id_2;
  inout wire _id_1;
  logic id_3, id_4;
  assign id_3 = id_4[id_1];
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
