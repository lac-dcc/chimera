// Seed: 3511397535
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    output supply1 id_2,
    output tri id_3,
    input tri0 id_4,
    output tri id_5,
    output wire id_6
);
  assign id_6 = 1;
endmodule
module module_1 (
    input  tri1  id_0,
    input  tri0  id_1,
    output tri   id_2,
    output tri   id_3,
    input  uwire id_4,
    input  uwire id_5
);
  assign id_3 = id_5;
  assign id_2 = 1;
  assign id_3 = 1'b0;
  module_0(
      id_1, id_2, id_2, id_3, id_0, id_3, id_3
  ); id_7(
      id_5, 1'b0 | id_1
  );
  assign id_3 = 1;
endmodule
