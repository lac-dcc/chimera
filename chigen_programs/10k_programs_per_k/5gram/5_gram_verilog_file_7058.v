// Seed: 4177481593
module module_0 (
    input tri1 id_0,
    output wand id_1,
    input supply1 id_2,
    input wand id_3,
    input tri id_4,
    input wand id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri1 id_8,
    input tri1 id_9,
    output wire id_10,
    output wire id_11,
    output tri0 id_12
);
  assign id_12 = 1 && id_8 && 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd80,
    parameter id_8  = 32'd67
) (
    input wand id_0,
    input uwire id_1,
    input wand id_2,
    output tri id_3,
    input supply1 id_4,
    input tri id_5,
    input supply1 id_6,
    output tri id_7,
    input wire _id_8,
    input tri1 id_9,
    input uwire _id_10,
    input tri1 id_11,
    inout wand id_12,
    output wor id_13
);
  assign id_12 = id_6 == 1;
  module_0 modCall_1 (
      id_11,
      id_3,
      id_9,
      id_4,
      id_5,
      id_4,
      id_4,
      id_7,
      id_12,
      id_0,
      id_13,
      id_7,
      id_13
  );
  struct packed {
    logic [-1  ==  id_8 : 1] id_15;
    logic id_16;
  } [id_10 : 1]
      id_17, id_18;
  logic id_19;
endmodule
