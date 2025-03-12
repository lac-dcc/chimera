// Seed: 912442056
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  assign module_1.id_3 = 0;
  output wire id_2;
  inout wire id_1;
  wire [-1 'h0 : 1] id_10;
endmodule
module module_1 #(
    parameter id_3 = 32'd68,
    parameter id_7 = 32'd3
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    _id_7
);
  input wire _id_7;
  output logic [7:0] id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_5,
      id_2,
      id_1,
      id_1,
      id_1
  );
  inout wire id_4;
  input wire _id_3;
  output wire id_2;
  inout wire id_1;
  assign id_6[1] = -1 >> id_3;
  assign id_6[id_7+~id_3] = id_4;
endmodule
