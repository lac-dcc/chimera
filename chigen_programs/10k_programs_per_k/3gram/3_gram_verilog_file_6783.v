// Seed: 3985257356
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input supply0 id_2,
    output wor id_3,
    output wor id_4,
    output wor id_5,
    output wire id_6,
    input wor id_7,
    input tri0 id_8,
    input tri0 id_9,
    input tri0 id_10
);
  wand id_12;
  parameter id_13 = 1;
  assign id_12 = 1;
  wire id_14;
  assign id_5 = 1'h0;
endmodule
program module_1 (
    output wand id_0,
    input uwire id_1,
    input uwire id_2,
    input tri id_3,
    input supply0 id_4,
    output wand id_5,
    input tri1 id_6,
    output wire id_7,
    input uwire id_8,
    output logic id_9,
    input wire id_10,
    input uwire id_11,
    input uwire id_12
);
  module_0 modCall_1 (
      id_0,
      id_11,
      id_8,
      id_5,
      id_7,
      id_7,
      id_7,
      id_12,
      id_10,
      id_8,
      id_1
  );
  assign modCall_1.id_6 = 0;
  initial begin : LABEL_0
    id_9 <= id_2;
  end
endprogram
