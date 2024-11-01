// Seed: 408767
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output tri id_2,
    input tri1 id_3,
    output wor id_4,
    input tri id_5,
    output supply1 id_6,
    input wand id_7
);
  id_9(
      .id_0(1), .id_1(1), .id_2(id_6)
  );
  assign id_2 = 1;
  wire id_10;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output wire  id_2
);
  module_0(
      id_0, id_1, id_2, id_0, id_2, id_1, id_2, id_0
  );
endmodule
module module_2 (
    input tri id_0,
    output tri id_1,
    input supply1 id_2
);
  id_4 :
  assert property (@(posedge 1'b0) id_2)
  else $display($display);
  module_0(
      id_2, id_2, id_4, id_2, id_4, id_4, id_1, id_4
  );
endmodule
