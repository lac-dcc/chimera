// Seed: 226913724
module module_0 (
    input wor id_0,
    output supply1 id_1,
    output supply0 id_2,
    output wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    input wire id_6,
    input wand id_7,
    input tri id_8,
    input uwire id_9,
    input uwire id_10
);
  if (1) begin : LABEL_0
    wor id_12, id_13 = id_4;
  end else begin : LABEL_0
    wire id_14;
    wire id_15;
  end
  supply1 id_16, id_17;
  assign module_1.id_9 = 0;
  wire id_18;
  assign id_17 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    input tri1 id_2,
    input uwire id_3,
    output wand id_4,
    output tri1 id_5,
    input wand id_6,
    input wor id_7,
    input supply1 id_8,
    output tri id_9,
    output wor id_10,
    input tri1 id_11
);
  assign id_9 = id_6;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_9,
      id_5,
      id_6,
      id_11,
      id_3,
      id_7,
      id_11,
      id_0,
      id_0
  );
endmodule
