// Seed: 3805639878
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4 = id_4;
  wire id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_6 = 32'd77
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  inout wire _id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_8
  );
  input wire id_3;
  output wire id_2;
  xor primCall (id_8, id_7, id_1, id_4, id_3);
  inout wire id_1;
  assign id_5[id_6 : (1'b0)] = id_4;
  parameter id_9 = -1;
endmodule
