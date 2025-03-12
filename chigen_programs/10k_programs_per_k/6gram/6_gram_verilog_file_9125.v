// Seed: 3376136090
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    input wor id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    output uwire id_6,
    input wor id_7,
    output wor id_8,
    output supply1 id_9,
    input wire id_10,
    input tri1 module_0,
    input uwire id_12,
    input supply1 id_13,
    input wor id_14
);
  tri id_16;
  wire [-1 : -1 'b0] id_17;
  parameter id_18 = 1;
  wire id_19;
  assign module_1.id_1 = 0;
  assign id_16 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    output logic id_5
);
  wire id_7;
  genvar id_8;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  wire id_9, id_10;
  always
    if (1) begin : LABEL_0
      id_8 = id_9;
    end else id_5 <= -1;
endmodule
