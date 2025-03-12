// Seed: 3523885941
module module_0 #(
    parameter id_4 = 32'd69,
    parameter id_9 = 32'd73
) (
    output uwire id_0
);
  logic id_2;
  logic id_3 = id_3, _id_4;
  always id_2 <= 1'b0;
  logic id_5;
  logic id_6;
  wire id_7[id_4 : 1  >  -1], id_8;
  assign id_3[id_4==id_4] = id_3;
  logic [1 : -1] _id_9;
  ;
  wire id_10;
  wire [-1 : id_9] id_11;
endmodule
module module_1 #(
    parameter id_11 = 32'd42
) (
    input tri0 id_0
    , id_15,
    input tri0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri id_4,
    input tri id_5,
    input uwire id_6,
    input supply1 id_7,
    output supply0 id_8,
    input supply1 id_9,
    input tri0 id_10,
    output wire _id_11[id_11  *  1 : -1  +  id_11],
    input wire id_12,
    input wor id_13
);
  or primCall (
      id_8, id_3, id_6, id_2, id_7, id_0, id_13, id_5, id_9, id_12, id_1, id_4, id_10, id_15
  );
  module_0 modCall_1 (id_8);
  assign modCall_1.id_2 = 0;
endmodule
