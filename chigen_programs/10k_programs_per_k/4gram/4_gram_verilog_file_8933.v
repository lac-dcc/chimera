// Seed: 740446713
module module_0 (
    input  wor   id_0,
    output wor   id_1,
    output uwire id_2,
    output uwire id_3,
    input  uwire id_4,
    output tri   id_5
);
  wire id_7;
  module_2(
      id_0, id_4
  );
  wand id_8, id_9 = 1;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wor  id_1,
    input  tri  id_2,
    output tri  id_3
);
  assign id_3 = id_0;
  module_0(
      id_2, id_3, id_3, id_3, id_2, id_3
  );
endmodule
module module_2 (
    input supply1 id_0,
    input uwire   id_1
);
  id_3(
      .id_0(id_0), .id_1(1'b0)
  );
  wor id_4;
  id_5 :
  assert property (@(negedge id_4) 1)
  else $display;
endmodule
