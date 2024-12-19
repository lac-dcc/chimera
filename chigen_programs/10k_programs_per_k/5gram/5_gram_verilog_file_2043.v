// Seed: 1118639307
module module_0 #(
    parameter id_8 = 32'd83,
    parameter id_9 = 32'd86
) (
    output tri1 id_0,
    output wor id_1,
    input wand id_2,
    input supply1 id_3,
    output tri id_4,
    input wand id_5,
    input wire id_6
);
  defparam id_8.id_9 = 1;
  assign module_1.type_5 = 0;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    output tri0 id_2,
    input wire id_3,
    input tri0 id_4,
    input wor id_5,
    input wire id_6,
    input supply0 id_7,
    input wand id_8,
    input wand id_9,
    input supply1 id_10
);
  tri0 id_12;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_8,
      id_5,
      id_2,
      id_5,
      id_5
  );
  always @(*) begin : LABEL_0
    id_12 = 1;
  end
  uwire id_13 = $display(id_8, {id_1 ==? 1 >= 1, id_1 < id_13}, 1 ==? "", id_7);
  assign id_12 = id_6;
endmodule
