// Seed: 185324374
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    output wor id_6,
    input tri id_7
);
  logic id_9;
  assign id_9 = 1'b0;
  assign id_0 = id_9;
  parameter id_10 = 1;
  assign id_0 = id_4;
endmodule
module module_1 #(
    parameter id_3 = 32'd57
) (
    output wand id_0,
    input wire id_1,
    input wand id_2,
    input wand _id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input wand id_7,
    input wire id_8,
    input tri id_9
);
  struct packed {id_11 id_12;} [id_3 : -1 'h0] id_13;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_8,
      id_5,
      id_6,
      id_5,
      id_4,
      id_7
  );
  assign modCall_1.id_7 = 0;
endmodule
