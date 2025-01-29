// Seed: 717842311
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input wire id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri0 id_6,
    input tri id_7,
    input supply1 id_8,
    input tri id_9,
    input uwire id_10,
    input uwire id_11,
    output wor id_12,
    input uwire id_13
);
  wire id_15;
  assign id_12 = id_10;
  wire id_16;
  tri1 id_17, id_18 = id_11;
  id_19(
      -1, id_6, 1, (-1), id_13
  );
  wire id_20;
  wire id_21, id_22 = id_22, id_23;
  initial begin : LABEL_0
    id_17 = id_1;
  end
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  tri   id_2,
    output wor   id_3,
    input  wor   id_4,
    output uwire id_5,
    output uwire id_6,
    input  uwire id_7
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_5,
      id_0,
      id_4,
      id_5,
      id_2,
      id_7,
      id_0,
      id_0,
      id_7,
      id_5,
      id_7
  );
  assign id_5 = {-1'b0};
endmodule
