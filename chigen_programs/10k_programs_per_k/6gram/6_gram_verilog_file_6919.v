// Seed: 4233263881
module module_0 (
    output tri1 id_0,
    input  wor  id_1,
    output tri1 id_2,
    output wand id_3,
    output tri0 id_4
);
  assign id_3 = -1'b0 || id_1;
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    output wor id_2,
    output tri0 id_3,
    input uwire id_4,
    input tri1 id_5,
    output supply0 id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_2,
      id_3
  );
  assign modCall_1.type_7 = 0;
  assign id_0 = id_4;
  logic id_8;
  ;
  assign id_0 = id_8;
endmodule
module module_2 #(
    parameter id_0  = 32'd91,
    parameter id_10 = 32'd52,
    parameter id_12 = 32'd15
) (
    output wand _id_0,
    input wire id_1,
    input supply1 id_2,
    input wand id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wire id_6,
    output uwire id_7,
    input wire id_8,
    input wire id_9,
    output tri _id_10,
    output tri0 id_11,
    input supply0 _id_12,
    input wor id_13,
    output supply0 id_14,
    input wire id_15
    , id_18,
    output uwire id_16
);
  logic [-1  ==  id_10 : id_12  -  id_0] id_19;
  module_0 modCall_1 (
      id_6,
      id_13,
      id_14,
      id_11,
      id_11
  );
  assign modCall_1.type_7 = 0;
  assign id_18 = 1;
endmodule
