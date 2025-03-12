// Seed: 1694621329
macromodule module_0 (
    output wire id_0,
    input supply1 id_1,
    output tri1 id_2,
    output wand id_3,
    input tri id_4,
    input wire id_5
);
  assign id_0 = id_1;
endmodule
module module_1 #(
    parameter id_0  = 32'd85,
    parameter id_14 = 32'd29,
    parameter id_3  = 32'd43,
    parameter id_4  = 32'd35
) (
    input uwire _id_0,
    input supply1 id_1,
    input tri1 id_2,
    input supply1 _id_3,
    input wand _id_4,
    input tri1 id_5,
    output uwire id_6,
    input tri0 id_7,
    input tri1 id_8,
    output wor id_9,
    output tri id_10,
    output tri1 id_11,
    output logic id_12,
    input wand id_13,
    output tri _id_14
);
  always_ff @(id_3 or posedge -1) id_12 <= id_7 + -1;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_10,
      id_9,
      id_7,
      id_13
  );
  assign modCall_1.id_4 = 0;
  localparam id_16 = 1;
  wor [1 : id_4] id_17 = 1;
  struct packed {
    logic [-1  >  1 : ~  id_3]   id_18;
    logic [id_14 : id_4  ==?  1] id_19;
  } [1 : ~  id_14  ==  id_0] id_20;
endmodule
