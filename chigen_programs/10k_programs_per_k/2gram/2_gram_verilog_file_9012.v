// Seed: 31902752
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign module_2.id_1 = 0;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_3,
      id_2
  );
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_7;
  ;
endmodule
module module_2 #(
    parameter id_4 = 32'd37
) (
    input uwire id_0,
    input wire id_1
    , id_11,
    input tri0 id_2,
    input supply1 id_3,
    input wand _id_4,
    output wor id_5,
    input uwire id_6,
    input wand id_7,
    inout supply1 id_8,
    output wire id_9
);
  assign id_8 = id_6;
  wire id_12;
  integer id_13;
  ;
  assign id_13 = 1;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_13,
      id_12
  );
  logic [-1 : 1  -  |  id_4  ==  1] id_14;
  assign id_8 = id_3 - id_4;
  wire id_15;
  xor primCall (id_5, id_8, id_1, id_12, id_6, id_0, id_11, id_13, id_3, id_7, id_2);
endmodule
