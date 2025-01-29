// Seed: 3774194095
module module_0 (
    output supply1 id_0,
    output tri0 id_1,
    input tri id_2
);
  assign id_1 = 1'b0 | id_2;
  logic [7:0][1 'b0] id_4;
  supply0 id_5, id_6 = 1 ? -1 : -1'b0;
  uwire id_7;
  supply1 id_8 = id_2, id_9;
  wire id_10;
  localparam integer id_11 = id_7;
  localparam id_12 = 1;
endmodule
program module_1 (
    input wand id_0,
    input supply0 id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    output wor id_5,
    input tri0 id_6,
    input tri0 id_7
);
  wor id_9 = -1;
  nor primCall (id_5, id_7, id_9, id_6, id_2, id_3);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
