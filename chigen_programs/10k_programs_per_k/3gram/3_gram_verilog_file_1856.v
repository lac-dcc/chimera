// Seed: 3155201634
module module_0 (
    output tri id_0,
    input tri1 id_1,
    output wire id_2,
    input supply1 id_3,
    output tri0 id_4,
    output wire id_5,
    input tri0 id_6
    , id_18,
    output wire id_7,
    output uwire id_8,
    output uwire id_9,
    output wire id_10,
    output supply1 id_11,
    input uwire id_12,
    output supply0 id_13,
    input wire id_14,
    input supply0 id_15,
    output tri0 id_16
);
  assign id_2 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd58
) (
    input uwire id_0,
    input tri1 _id_1,
    output supply0 id_2
);
  logic [7:0][1 : !  id_1] id_4;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_14 = 0;
  assign id_4[id_1-1] = 1'b0;
endmodule
