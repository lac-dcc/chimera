// Seed: 3007973873
module module_0 (
    input  tri0  id_0,
    input  uwire id_1,
    output wire  id_2,
    input  tri1  id_3,
    output tri0  id_4,
    input  uwire id_5,
    output wire  id_6,
    output tri0  id_7,
    input  uwire id_8,
    input  uwire id_9,
    input  wor   id_10,
    input  tri0  id_11,
    input  wor   id_12
);
  assign id_6 = id_5 + ~id_11;
  parameter id_14 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd31,
    parameter id_4 = 32'd93
) (
    output tri  id_0,
    input  tri0 id_1
    , _id_3
);
  logic _id_4;
  ;
  bit id_5;
  ;
  always @(posedge id_3) id_5 = id_5 == id_3 | id_4.id_3(-1);
  logic [-1 : id_3  +  id_4] id_6 = id_6[-1 :-1], id_7, id_8, id_9, id_10, id_11;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
