// Seed: 4209093076
module module_0 (
    input wire id_0,
    input tri0 id_1,
    output wor id_2,
    input supply0 id_3,
    input tri id_4,
    input tri1 id_5,
    output uwire id_6,
    input wire id_7,
    output wand id_8
);
  wire id_10;
  assign id_2 = id_7;
endmodule
module module_1 #(
    parameter id_1 = 32'd41,
    parameter id_9 = 32'd14
) (
    output wire id_0,
    input wor _id_1,
    output tri id_2,
    input supply1 id_3,
    output wor id_4,
    input supply1 id_5,
    output uwire id_6,
    input tri1 id_7,
    output supply0 id_8,
    input uwire _id_9
);
  wire [id_1  -  -1 : id_9] id_11;
  wire id_12;
  reg [-1 : -1] id_13;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_7,
      id_7,
      id_5,
      id_0,
      id_7,
      id_2
  );
  assign modCall_1.id_0 = 0;
  always @(-1 or 1) begin : LABEL_0
    if (1) begin : LABEL_1
      id_13 = -1;
    end else assume (id_12 == id_11);
  end
endmodule
