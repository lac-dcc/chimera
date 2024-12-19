// Seed: 9894313
program module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endprogram
module module_1 (
    id_1,
    id_2,
    id_3#(
        .id_4 (id_5),
        .id_6 (~id_7[1?1 : 1'b0 : 1]),
        .id_8 (id_9),
        .id_10((id_10) == 1),
        .id_11(1)
    ),
    id_12,
    id_13,
    id_14,
    id_15#(.id_16(id_13)),
    id_17,
    id_18
);
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = id_4;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_18,
      id_18,
      id_18,
      id_18
  );
  always id_16 <= #0 1;
endmodule
