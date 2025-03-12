// Seed: 2914713089
module module_0 (
    input tri id_0,
    output wire id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri id_4,
    input uwire id_5,
    input wire id_6,
    input uwire id_7,
    input wand id_8,
    output logic id_9
);
  parameter time id_11 = 1 ? -1 : -1 << 1'h0, id_12 = -1, id_13 = -1, id_14 = id_11;
  always begin : LABEL_0
    id_9 = id_4;
  end
endmodule
module module_1 (
    input tri1 id_0,
    output supply0 id_1,
    input wire id_2,
    output wire id_3,
    output logic id_4,
    input tri0 id_5,
    input wire id_6,
    output logic id_7,
    input supply1 id_8
);
  initial id_7 = id_6;
  assign id_3 = 1;
  final id_4 <= 1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_8,
      id_5,
      id_5,
      id_6,
      id_6,
      id_0,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
