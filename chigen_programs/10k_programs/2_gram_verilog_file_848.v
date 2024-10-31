// Seed: 882852787
module module_0 (
    input  tri   id_0,
    input  uwire id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output tri   id_4
);
  assign id_4 = id_3;
endmodule
module module_1 (
    input  tri1  id_0,
    output tri   id_1,
    output tri0  id_2,
    input  uwire id_3,
    output tri1  id_4,
    input  tri0  id_5,
    input  wire  id_6
);
  assign id_4 = 1;
  not (id_2, id_0);
  module_0(
      id_3, id_5, id_6, id_0, id_2
  );
  wire id_8;
  wire id_9;
  always disable id_10;
  wire id_11;
  assign id_2 = 1;
endmodule
