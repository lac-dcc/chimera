// Seed: 4286304496
module module_0 (
    input wor id_0,
    output wire id_1,
    input wor id_2,
    output tri1 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    output tri id_7,
    output wand id_8,
    input wand id_9,
    input uwire id_10,
    input tri0 id_11,
    output supply1 id_12,
    input wand id_13,
    input wand id_14
);
  string  id_16;
  integer id_17;
  id_18(
      1, 1 ^ (1'h0)
  );
  wire id_19;
  assign id_16 = "";
  always force id_3 = 1'b0;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    input wor id_2,
    output supply1 id_3,
    input supply1 id_4
);
  wire id_6;
  module_0(
      id_2, id_6, id_2, id_1, id_0, id_2, id_4, id_6, id_3, id_6, id_6, id_0, id_1, id_0, id_4
  ); id_7 :
  assert property (@(posedge id_2) id_6)
  else $display(id_6);
  uwire id_8 = id_6;
endmodule
