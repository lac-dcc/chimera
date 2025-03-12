// Seed: 2495100049
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
  output wire id_9;
  inout wire id_8;
  assign module_1.id_2 = 0;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd93
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_4,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  output wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  nor primCall (id_4, id_3, id_7);
  inout wire _id_2;
  output wire id_1;
  assign id_5[$realtime] = 1;
  assign id_3[id_2] = id_2;
endmodule
