// Seed: 349423204
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri id_3,
    input wor id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wor id_7,
    output tri1 id_8,
    output supply0 id_9,
    input tri0 id_10
);
  always_latch begin : LABEL_0
    begin : LABEL_1
      $unsigned(58);
      ;
    end
  end
  assign id_0 = !id_1 / -1 - 1 < 1;
  logic id_12 = id_7, id_13;
endmodule
module module_1 #(
    parameter id_11 = 32'd15
) (
    input  wor   id_0,
    input  tri0  id_1,
    input  wire  id_2,
    input  wire  id_3,
    output uwire id_4,
    input  tri0  id_5,
    output tri0  id_6,
    input  wire  id_7
);
  logic id_9;
  wire [-1 : 1] id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_5,
      id_5,
      id_1,
      id_1,
      id_4,
      id_6,
      id_1
  );
  assign modCall_1.id_3 = 0;
  wire _id_11;
  logic [7:0][-1][id_11] id_12;
endmodule
