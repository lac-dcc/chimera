// Seed: 2202079921
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    input tri1 id_4,
    input supply1 id_5,
    output uwire id_6,
    output tri1 id_7,
    input tri id_8,
    input tri1 id_9,
    input supply0 id_10,
    output wor id_11,
    input wor id_12,
    input supply0 id_13,
    input wor id_14
);
  wire id_16;
endmodule
module module_1 (
    input tri1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri id_3,
    input supply1 id_4,
    input logic id_5,
    inout logic id_6,
    input supply1 id_7,
    input wire id_8
);
  assign id_6 = id_0 ? 1 : 1;
  wand id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_10,
      id_8,
      id_4,
      id_0,
      id_10,
      id_10,
      id_10,
      id_1,
      id_1,
      id_10,
      id_2,
      id_1,
      id_8
  );
  assign modCall_1.type_21 = 0;
  tri id_11;
  initial begin : LABEL_0
    fork
      for (id_6 = 1; !id_8; id_10 = 1'b0) begin : LABEL_0
        id_6 = 1'b0;
        id_6 <= id_5;
        id_11 = id_3;
        id_6 <= 1;
      end
    join_none
  end
  assign id_10 = id_4;
  wire id_12 = id_0;
endmodule
