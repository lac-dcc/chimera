// Seed: 34466273
module module_0 (
    input tri0 id_0,
    input wor id_1,
    input tri1 id_2,
    input tri id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    input wire id_7,
    output uwire id_8,
    output supply1 id_9,
    input uwire id_10,
    input wor id_11,
    output wor id_12,
    output wand id_13
);
  assign id_9 = id_11;
  wire id_15;
endmodule
module module_1 (
    input supply1 id_0
);
  assign id_2 = id_0;
  assign id_2 = id_0;
  uwire id_3;
  assign id_3 = 1'b0 - id_0;
  id_4 :
  assert property (@(posedge id_0, posedge id_3) ~1)
  else;
  module_0(
      id_3, id_3, id_4, id_3, id_3, id_4, id_3, id_2, id_3, id_3, id_2, id_2, id_2, id_4
  );
endmodule
