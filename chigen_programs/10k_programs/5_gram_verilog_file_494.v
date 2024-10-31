// Seed: 985294020
module module_0 (
    output tri id_0,
    output wand id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    output wand id_8,
    input wire id_9
);
  wand id_11 = id_9 !=? 1;
endmodule
module module_1 (
    output uwire id_0,
    output logic id_1,
    output uwire id_2,
    output supply0 id_3,
    input logic id_4,
    input tri id_5,
    input tri id_6,
    input uwire id_7,
    output wor id_8,
    output wor id_9
);
  uwire id_11;
  module_0(
      id_2, id_3, id_7, id_7, id_7, id_6, id_6, id_6, id_3, id_6
  );
  initial
    if (1'd0 - id_6 & id_11++)
      if (1 == id_11 - id_4) begin
        #1;
        id_1 = 1;
        id_1 <= id_4;
      end
endmodule
