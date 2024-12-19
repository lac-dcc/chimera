// Seed: 306944589
module module_0 (
    output wand id_0,
    input wand id_1,
    input supply0 id_2,
    output tri1 id_3,
    input wire id_4,
    input wor id_5,
    input wire id_6,
    output supply1 id_7
);
  tri0 id_9 = 1;
  always #1 $display(1);
  assign id_7 = id_6;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    input tri0 id_2,
    input uwire id_3,
    input supply1 id_4,
    input tri id_5,
    output tri0 id_6,
    output logic id_7,
    input wor id_8,
    input tri1 id_9
);
  initial begin : LABEL_0
    id_7 <= 1'b0;
    id_1 <= id_0;
  end
  module_0 modCall_1 (
      id_6,
      id_2,
      id_5,
      id_6,
      id_5,
      id_8,
      id_2,
      id_6
  );
  assign modCall_1.type_2 = 0;
endmodule
