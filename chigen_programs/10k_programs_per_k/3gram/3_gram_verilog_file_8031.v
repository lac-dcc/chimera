// Seed: 1989625355
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output supply0 id_2,
    output tri id_3,
    output supply1 id_4,
    input uwire id_5
);
  assign id_4 = id_1;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input wire id_1,
    output uwire id_2,
    output supply0 id_3,
    input wire id_4,
    output logic id_5,
    input tri0 id_6,
    output wand id_7,
    output tri0 id_8,
    input logic id_9,
    output wor id_10,
    output wand id_11
);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_8,
      id_8,
      id_0,
      id_4
  );
  id_13 :
  assert property (@(negedge 1) id_9)
  else begin : LABEL_0
    id_5 <= id_13;
    id_10 = 1'b0;
    id_5 <= id_9 - 1;
  end
  wire id_14;
  nor primCall (id_5, id_4, id_9, id_6, id_1);
  uwire id_15 = 1 | 1;
endmodule
