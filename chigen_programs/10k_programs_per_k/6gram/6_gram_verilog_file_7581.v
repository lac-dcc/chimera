// Seed: 2630932760
module module_0 (
    input wand id_0,
    input uwire id_1,
    output supply0 id_2,
    input tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    output supply0 id_7
    , id_15,
    input tri0 id_8,
    input tri0 id_9,
    input wire id_10,
    input tri1 id_11,
    output uwire id_12,
    output uwire id_13
);
  logic id_16;
  assign id_16 = id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd36
) (
    input tri id_0,
    input tri id_1,
    input supply0 _id_2,
    input tri0 id_3,
    input supply0 id_4,
    output tri1 id_5,
    input wire id_6,
    input tri0 id_7,
    output tri0 id_8,
    output wire id_9
);
  wire [id_2 : 1  -  id_2] id_11;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_1,
      id_6,
      id_8,
      id_7,
      id_5,
      id_1,
      id_1,
      id_1,
      id_3,
      id_9,
      id_9
  );
  assign modCall_1.id_5 = 0;
  wire id_12;
  logic [-1 : -1] id_13 = 1 ~^ -1;
endmodule
