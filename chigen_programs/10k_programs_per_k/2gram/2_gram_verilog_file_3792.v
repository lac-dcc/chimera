// Seed: 999864891
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
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_10 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6#(
        .id_7(-1),
        .id_8(1 - 1 <= 1),
        .id_9(1 == -1)
    )
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_7,
      id_6,
      id_7,
      id_2,
      id_7
  );
  inout wire id_3;
  inout wire id_2;
  xor primCall (id_4, id_8, id_7, id_3, id_6, id_2, id_5, id_9);
  output logic [7:0] id_1;
  assign id_1[(1)] = (id_2);
  assign id_4 = id_7;
endmodule
