// Seed: 3004911707
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = 1'd0;
  assign id_3 = id_5;
  assign module_1.id_13 = 0;
  assign id_3 = id_5 ? 1 : id_5;
endmodule
module module_1 (
    output tri id_0,
    output wand id_1,
    input uwire id_2,
    input wor id_3,
    input tri1 id_4,
    input tri0 id_5,
    input tri id_6,
    output uwire id_7,
    input supply1 id_8,
    output tri1 id_9,
    input tri id_10,
    input wire id_11
);
  supply1 id_13;
  nor primCall (id_1, id_10, id_13, id_5, id_3, id_4, id_6);
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_13
  );
  supply0 id_14;
  always @(posedge id_2 + id_6) $display(1 >> 1, 1, id_11 & 1, id_13, id_14, id_4 == 1);
endmodule
