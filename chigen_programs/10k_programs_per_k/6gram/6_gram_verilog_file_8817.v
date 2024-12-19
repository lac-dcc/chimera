// Seed: 2001740654
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  integer id_3;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    output wire id_2,
    input tri0 id_3,
    input supply0 id_4
    , id_11,
    input tri1 id_5,
    input uwire id_6,
    input supply1 id_7,
    input tri1 id_8,
    input supply0 id_9
);
  tri0 id_12, id_13, id_14;
  rpmos (id_8 == id_3, 1, 1);
  assign id_12 = id_0;
  reg id_15;
  assign id_13 = id_9;
  uwire id_16;
  module_0 modCall_1 (
      id_16,
      id_11
  );
  assign modCall_1.id_1 = 0;
  always @(*) begin : LABEL_0
    id_11 = 1 - id_12;
    id_12 = id_12;
    if (1 && id_16) id_15 <= 1;
  end
endmodule
