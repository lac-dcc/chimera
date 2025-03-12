// Seed: 1181249573
module module_0 (
    id_1,
    id_2#(
        .id_3 (id_4),
        .id_5 (id_6[1]),
        .id_7 (1),
        .id_8 (-1),
        .id_9 (-1),
        .id_10(-1),
        .id_11(-1)
    ),
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_7;
  output logic [7:0] id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_6,
      id_6,
      id_2,
      id_6
  );
  input wire id_3;
  nand primCall (id_2, id_6, id_5, id_3, id_4);
  inout logic [7:0] id_2;
  output wire id_1;
  logic [1 : -1] id_8;
  always begin : LABEL_0
    id_2[module_1[1'b0]] <= 1;
  end
endmodule
