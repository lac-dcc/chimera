// Seed: 1312494015
module module_0 (
    output wand id_0,
    input uwire id_1,
    output tri id_2,
    output tri0 id_3,
    output supply0 id_4,
    input supply1 id_5,
    output tri id_6,
    input supply1 id_7,
    output supply1 id_8,
    output wor id_9
);
  wire id_11, id_12;
  wire id_13;
  wor  id_14 = 1;
  assign id_2 = ~id_14;
  assign id_4 = 1;
  id_15(
      .id_0(1), .id_1(id_0), .id_2(1), .id_3(1'b0)
  );
  wire id_16;
  id_17 :
  assert property (@(posedge 1) id_16)
  else $display(1);
endmodule
module module_1 (
    output tri1 id_0,
    output tri id_1,
    input wand id_2,
    input wor id_3,
    input tri id_4,
    input supply1 id_5,
    output supply0 id_6,
    output supply1 id_7,
    input supply1 id_8,
    input wand id_9,
    input wire id_10,
    output wand id_11
);
  assign id_7 = 1'b0;
  xor (id_0, id_8, id_10, id_2, id_9, id_4, id_5, id_3);
  module_0(
      id_0, id_4, id_6, id_1, id_6, id_5, id_11, id_9, id_11, id_0
  );
endmodule
