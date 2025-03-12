// Seed: 1960804681
module module_0 (
    output wor id_0,
    input supply0 id_1,
    output wand id_2,
    input wire id_3,
    output tri id_4,
    output uwire id_5,
    input uwire id_6,
    output supply1 id_7,
    input wand id_8,
    input supply1 id_9,
    input supply0 id_10
);
  assign id_4 = -1'b0;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input wire id_2
);
  assign id_1 = id_2;
  initial begin : LABEL_0
    id_1 <= 1'b0;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
