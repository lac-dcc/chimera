// Seed: 1487939025
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    input wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    output supply0 id_6
);
  wire [-1 : -1] id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wor id_1,
    output tri1 id_2
);
  logic id_4;
  ;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_4 = 0;
endmodule
module module_2 #(
    parameter id_0 = 32'd76,
    parameter id_1 = 32'd32,
    parameter id_5 = 32'd27
) (
    output supply1 _id_0,
    input tri1 _id_1
    , _id_5,
    input tri1 id_2,
    output tri0 id_3
);
  wire [1 : id_5] id_6;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3
  );
  logic [id_1 : id_0] id_7 = -1'h0;
endmodule
