// Seed: 2933016597
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input wand id_2,
    output tri1 id_3,
    output wire id_4,
    input wor id_5,
    input wire id_6,
    input tri0 id_7,
    output supply1 id_8,
    output tri0 id_9,
    input uwire id_10,
    output wand id_11,
    input wand id_12,
    input tri id_13,
    output tri0 id_14,
    input wire id_15,
    output wor id_16
);
  assign id_14 = id_7, id_4 = 1;
  assign module_1.id_11 = 0;
endmodule
program module_1 (
    output logic id_0,
    input wor id_1,
    input tri id_2,
    input tri id_3,
    output logic id_4,
    input supply0 id_5,
    output logic id_6,
    output uwire id_7,
    output wor id_8,
    input uwire id_9,
    output uwire id_10,
    input tri id_11,
    input supply1 id_12,
    input tri id_13
);
  always begin : LABEL_0
    @(posedge 1) @(-1) id_0 <= id_3 ^ !-1;
  end
  always id_6 = -1'h0;
  module_0 modCall_1 (
      id_3,
      id_12,
      id_12,
      id_7,
      id_8,
      id_9,
      id_13,
      id_13,
      id_10,
      id_10,
      id_12,
      id_10,
      id_9,
      id_13,
      id_7,
      id_12,
      id_8
  );
  always_latch id_4 <= id_5 - -1;
endprogram
