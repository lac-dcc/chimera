// Seed: 1883401883
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    output wor id_2,
    output tri0 id_3,
    input wor id_4,
    input uwire id_5,
    output uwire id_6,
    input wor id_7,
    input supply0 id_8,
    input wand id_9,
    output tri0 id_10,
    output wor id_11,
    input tri0 id_12,
    input uwire id_13,
    input tri id_14,
    output tri0 id_15
);
  assign id_10 = id_0;
  assign module_1.type_1 = 0;
  assign id_3 = 1;
  wire id_17;
  assign id_2 = id_13;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    input tri0 id_2,
    input wor id_3,
    output wand id_4,
    output wand id_5,
    output supply0 id_6,
    input tri1 id_7,
    input uwire id_8,
    input wor id_9,
    output uwire id_10
);
  initial begin : LABEL_0
    id_1 <= id_0;
    $display;
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_5,
      id_10,
      id_7,
      id_2,
      id_10,
      id_8,
      id_3,
      id_8,
      id_10,
      id_5,
      id_9,
      id_3,
      id_8,
      id_4
  );
endmodule
