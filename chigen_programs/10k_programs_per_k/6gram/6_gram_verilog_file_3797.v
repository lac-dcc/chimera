// Seed: 1519807804
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input tri id_3,
    input supply1 id_4,
    input wire id_5,
    output wire id_6,
    input tri1 id_7,
    input tri id_8,
    output uwire id_9,
    output wor id_10,
    output wor id_11,
    output uwire id_12,
    input uwire id_13,
    output tri id_14
);
  wire id_16;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output tri id_0,
    output wor id_1,
    output logic id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    output wand id_6,
    input supply1 id_7,
    output logic id_8,
    output tri1 id_9,
    input tri id_10,
    output wand id_11
);
  initial begin : LABEL_0
    if (id_7) begin : LABEL_0
      id_8 <= 1;
    end
    id_2 = #1 id_3 > ~|id_7;
  end
  module_0 modCall_1 (
      id_10,
      id_0,
      id_9,
      id_5,
      id_5,
      id_5,
      id_11,
      id_7,
      id_5,
      id_0,
      id_0,
      id_1,
      id_1,
      id_7,
      id_0
  );
endmodule
