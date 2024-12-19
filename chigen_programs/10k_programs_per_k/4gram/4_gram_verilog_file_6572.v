// Seed: 2460829397
module module_0 (
    output wand id_0,
    input tri id_1,
    output tri1 id_2,
    output supply1 id_3,
    input logic id_4,
    input wand id_5,
    output wire id_6
);
  always force id_6 = id_4;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    output logic id_2,
    input logic id_3,
    output tri id_4,
    output logic id_5,
    output wand id_6
);
  wire id_8;
  initial begin : LABEL_0
    id_5 <= id_3;
    id_2 <= 1 & 1'b0;
    id_5 <= id_3;
    id_5 <= 1;
  end
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_6,
      id_3,
      id_1,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule
