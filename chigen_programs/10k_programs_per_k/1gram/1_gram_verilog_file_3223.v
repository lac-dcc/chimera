// Seed: 4067869700
module module_0 (
    input uwire id_0,
    input tri id_1,
    input uwire id_2,
    output tri0 id_3,
    input wand id_4,
    input supply0 id_5,
    input wand id_6,
    input tri id_7,
    output tri0 id_8,
    input wor id_9,
    input tri id_10,
    input wand id_11,
    input wor id_12,
    input wire id_13,
    output tri0 id_14,
    input supply0 id_15,
    input uwire id_16
);
  wire id_18;
  wire id_19;
  assign module_1._id_17 = 0;
endmodule
module module_1 #(
    parameter id_0  = 32'd8,
    parameter id_14 = 32'd22,
    parameter id_17 = 32'd83,
    parameter id_3  = 32'd50
) (
    input tri1 _id_0,
    input uwire id_1,
    input wire id_2,
    output wire _id_3
    , id_21,
    input wire id_4[id_0 : id_3],
    output supply1 id_5,
    output tri1 id_6,
    input tri id_7,
    output supply1 id_8,
    input wor id_9[this  &&  id_17 : id_14],
    output wor id_10,
    input tri1 id_11,
    input wand id_12,
    output tri id_13,
    output wand _id_14,
    input uwire id_15,
    output wire id_16,
    output tri1 _id_17,
    input wor id_18,
    output wor id_19
);
  assign id_16 = id_1 - id_12;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_15,
      id_5,
      id_18,
      id_4,
      id_15,
      id_12,
      id_19,
      id_7,
      id_9,
      id_9,
      id_11,
      id_1,
      id_10,
      id_2,
      id_2
  );
endmodule
