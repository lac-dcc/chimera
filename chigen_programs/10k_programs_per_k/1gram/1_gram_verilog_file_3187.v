// Seed: 2520177283
macromodule module_0 (
    output supply1 id_0,
    output tri id_1,
    output uwire id_2,
    input supply0 id_3,
    output tri0 id_4,
    input tri1 id_5,
    output wand id_6,
    input uwire id_7,
    output tri0 id_8,
    output wand id_9,
    input uwire id_10,
    input tri id_11
);
  tri1 id_13;
  wand id_14;
  assign id_13 = 'd0;
  assign id_0  = (id_10);
  initial if (id_7 == id_14) $display((1));
  byte id_15;
  wand id_16;
  assign id_9 = 1;
  assign id_2 = id_11;
  assign id_6 = (id_15);
  logic [7:0][1  ==  1 'b0] id_17 (
      id_8,
      id_11,
      id_2,
      id_9,
      id_6,
      id_15,
      id_15
  );
  wire id_18;
  assign module_1.type_3 = 0;
  assign id_1 = id_14;
  assign id_2 = id_16;
  wire id_19;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input tri1 id_2,
    output logic id_3,
    input supply0 id_4,
    input tri0 id_5,
    input logic id_6,
    input supply1 id_7,
    input supply1 id_8,
    input wand id_9,
    input tri1 id_10,
    output supply0 id_11,
    output wire id_12,
    input tri0 id_13
);
  assign id_11 = 1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_9,
      id_11,
      id_9,
      id_11,
      id_13,
      id_11,
      id_11,
      id_10,
      id_2
  );
  final begin : LABEL_0
    id_3 <= id_6;
  end
endmodule
