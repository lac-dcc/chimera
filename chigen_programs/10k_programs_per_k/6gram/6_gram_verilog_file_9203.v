// Seed: 863348451
module module_0 (
    output wor id_0,
    input uwire id_1,
    output tri0 id_2,
    output uwire id_3,
    output supply1 id_4,
    input supply1 id_5,
    output wor id_6,
    input wire id_7,
    input tri1 id_8
);
endmodule
module module_1 (
    input supply0 id_0,
    output wand id_1,
    input wire id_2,
    output wire id_3,
    output wor id_4,
    output logic id_5,
    output supply0 id_6,
    output tri1 id_7,
    output wire id_8,
    output wor id_9
);
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_9,
      id_7,
      id_2,
      id_8,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  wire id_12;
  wire id_13;
  always @(id_12) begin : LABEL_0
    id_5 <= 1;
  end
endmodule
