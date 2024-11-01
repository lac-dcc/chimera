// Seed: 269391591
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input wand id_2,
    input tri id_3,
    input wor id_4,
    input supply1 id_5,
    input tri id_6,
    input supply1 id_7,
    output tri0 id_8
);
  wire id_10;
  logic [7:0] id_11;
  assign id_11[(1)+1] = 1;
endmodule
module module_1 (
    input  wor  id_0,
    output wire id_1
);
  wand id_3;
  supply1 id_4;
  module_0(
      id_0, id_1, id_0, id_0, id_0, id_0, id_0, id_0, id_1
  );
  wor id_5;
  rpmos (id_4 != id_4 + id_1, ~id_0, id_1);
  uwire id_6;
  assign id_3 = id_5;
  assign id_6 = id_3 == id_6;
  assign id_1 = id_0;
endmodule
