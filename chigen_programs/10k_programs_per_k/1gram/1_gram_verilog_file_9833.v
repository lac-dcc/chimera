// Seed: 1903683357
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output wire  id_3,
    output tri0  id_4
);
  assign id_4 = 1;
  uwire id_6 = 1'b0;
  wire  id_7;
  wire id_8, id_9, id_10;
  supply0 id_11 = id_1#(.id_9("")) / id_0 * 1, id_12, id_13, id_14, id_15;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input tri1 id_3,
    input tri0 id_4
);
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_15 = 0;
  assign id_2 = 1;
  string id_8 = "", id_9;
endmodule
