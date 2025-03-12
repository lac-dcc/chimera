// Seed: 619136280
module module_0 (
    output uwire id_0,
    input wand id_1,
    output tri0 id_2,
    output supply0 id_3,
    input wire id_4,
    input tri1 id_5,
    input wand id_6,
    output supply1 id_7,
    input wand id_8,
    output tri id_9
);
endmodule
macromodule module_1 #(
    parameter id_0  = 32'd30,
    parameter id_10 = 32'd62,
    parameter id_2  = 32'd23,
    parameter id_8  = 32'd67
) (
    output wire _id_0,
    output supply1 id_1,
    input wire _id_2,
    input tri id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    input tri id_7,
    input wand _id_8,
    input supply0 id_9,
    input wand _id_10
);
  logic [id_2 : id_0  ==?  1] id_12;
  struct packed {logic [id_10 : id_8] id_13;} [-1 : 1] id_14;
  wire id_15;
  wire id_16;
  assign {id_2, 1 == id_6} = 1;
  always_comb id_14[-1 :-1'b0] <= -1;
  logic id_17;
  wire  id_18;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_1,
      id_4,
      id_9,
      id_5,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
