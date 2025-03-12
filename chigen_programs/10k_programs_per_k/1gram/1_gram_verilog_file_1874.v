// Seed: 936587606
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input wire id_2,
    output wand id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6,
    input wor id_7,
    input wor id_8,
    input tri0 id_9,
    output supply1 id_10,
    output tri1 id_11,
    output uwire id_12,
    output tri id_13,
    input tri0 id_14,
    input tri id_15,
    input wire id_16
);
  assign id_3 = id_16;
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    output supply1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output wand id_5,
    output logic id_6,
    output wor id_7
);
  assign id_6 = 1;
  assign id_6 = id_0;
  assign id_7 = -1;
  always_latch begin : LABEL_0
    begin : LABEL_1
      id_6 = -1;
    end
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_5,
      id_3,
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_2,
      id_7,
      id_5,
      id_7,
      id_3,
      id_4,
      id_0
  );
  wire id_9;
endmodule
