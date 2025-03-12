// Seed: 3551840461
module module_0 (
    output tri id_0,
    input tri id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wand id_4,
    input wand id_5,
    output supply1 id_6,
    output wor id_7
);
  assign id_7 = 1;
  assign module_0[-1] = id_3;
  reg id_9;
  always_ff @(1 or posedge 1) begin : LABEL_0
    disable id_10;
    id_9 = -1;
  end
endmodule
module module_1 #(
    parameter id_5 = 32'd90
) (
    input wor id_0,
    input supply0 id_1,
    output wire id_2,
    output wand id_3,
    output tri id_4,
    input uwire _id_5,
    output uwire id_6,
    input wor id_7,
    output supply1 id_8,
    input wand id_9
);
  wire [id_5 : -1] id_11;
  xor primCall (id_2, id_13, id_11, id_0, id_1, id_12);
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_9,
      id_1,
      id_1,
      id_7,
      id_4,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
