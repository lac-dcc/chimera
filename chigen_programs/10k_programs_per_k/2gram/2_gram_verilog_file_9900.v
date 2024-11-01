// Seed: 3243033489
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    output wand id_2,
    output tri0 id_3,
    input wire id_4,
    output wire id_5,
    input wire id_6,
    output wire id_7,
    input uwire id_8
);
  wire id_10;
  assign id_3 = id_1;
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output supply1 id_2,
    output tri1 id_3,
    output wire id_4,
    output supply1 id_5,
    input uwire id_6,
    output tri0 id_7,
    input wor id_8,
    output tri id_9,
    input supply1 id_10,
    input uwire id_11,
    input wor id_12
);
  assign id_7 = 1 || id_0;
  assign id_2 = id_8;
  id_14 :
  assert property (@(posedge 1) id_8 ? 1 : 1'b0)
  else;
  assign id_14 = 1'b0;
  module_0(
      id_8, id_10, id_5, id_9, id_8, id_9, id_6, id_5, id_11
  );
endmodule
