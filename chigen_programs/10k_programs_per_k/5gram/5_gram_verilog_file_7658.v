// Seed: 2656170496
module module_0 (
    output wand id_0,
    input  tri  id_1
);
endmodule
module module_1 (
    input tri id_0,
    output wand id_1,
    input wire id_2,
    input uwire id_3,
    input uwire id_4,
    input wor id_5,
    input wor id_6,
    output uwire id_7,
    output wor id_8,
    input supply0 id_9,
    output supply1 id_10,
    input wand id_11,
    input supply1 id_12
);
  assign id_7 = id_5;
  module_0(
      id_8, id_5
  );
endmodule
module module_2 (
    output uwire id_0,
    input supply0 id_1,
    input wire id_2,
    output wor id_3,
    input uwire id_4,
    input supply1 id_5,
    input wand id_6
);
  id_8 :
  assert property (@(posedge id_5) {1, ~id_8})
  else $display(1);
  module_0(
      id_8, id_5
  );
endmodule
