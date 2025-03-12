// Seed: 641636025
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    input wor id_2,
    output uwire id_3,
    input wire id_4,
    output tri id_5,
    input wire id_6,
    input supply0 id_7,
    output wand id_8
);
  logic id_10;
  logic id_11, id_12;
  assign id_12[1] = "";
endmodule
module module_1 (
    output logic id_0,
    input wand id_1,
    inout supply0 id_2,
    output tri0 id_3,
    input wand id_4,
    output tri0 id_5,
    output wor id_6
);
  always begin : LABEL_0
    id_0 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_2,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
