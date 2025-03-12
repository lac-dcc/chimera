// Seed: 337912023
module module_0 #(
    parameter id_18 = 32'd38,
    parameter id_19 = 32'd27
) (
    input uwire id_0,
    output wor id_1,
    input tri0 id_2,
    input uwire id_3,
    input wand id_4,
    input tri1 id_5,
    output tri1 id_6,
    output tri id_7,
    input wand id_8,
    output uwire id_9,
    output wire id_10,
    output tri id_11,
    input tri0 id_12,
    output supply0 id_13,
    input tri1 id_14,
    output tri0 id_15
);
  wire id_17;
  parameter id_18 = 1;
  supply1 _id_19 = id_0, id_20 = -1;
  assign id_10 = 1 == id_0;
  logic [id_19 : id_18] id_21 = 1;
  assign id_7 = ~id_0 == id_5;
endmodule
module module_1 #(
    parameter id_0 = 32'd35
) (
    input tri0 _id_0,
    input tri0 id_1,
    output tri1 id_2,
    output wire id_3,
    output tri1 id_4
    , id_15,
    input supply0 id_5,
    input wor id_6,
    inout uwire id_7,
    input tri id_8,
    input wire id_9,
    input tri0 id_10,
    input tri id_11,
    input tri0 id_12,
    output tri id_13
);
  assign id_15[id_0 :-1] = "";
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_5,
      id_9,
      id_4,
      id_13,
      id_12,
      id_2,
      id_13,
      id_3,
      id_9,
      id_3,
      id_12,
      id_4
  );
  assign #id_16 id_4 = (id_1);
endmodule
