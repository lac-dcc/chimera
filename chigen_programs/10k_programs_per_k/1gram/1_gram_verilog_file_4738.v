// Seed: 4255158140
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5, id_6, id_7;
  assign id_3 = id_2;
endmodule
module module_1 #(
    parameter id_10 = 32'd16,
    parameter id_11 = 32'd10,
    parameter id_6  = 32'd59,
    parameter id_9  = 32'd70
) (
    input uwire id_0,
    input wand id_1,
    input supply1 id_2[1  |  id_6 : id_9],
    input wor id_3[-1 : -1],
    output supply0 id_4,
    input tri1 id_5,
    input tri _id_6,
    input uwire id_7,
    input tri0 id_8,
    input wire _id_9,
    output wor _id_10,
    output tri0 _id_11,
    input wire id_12#(
        .id_17(1),
        .id_18(-1)
    ),
    input tri1 id_13,
    input wire id_14,
    input supply0 id_15
);
  assign id_4 = id_5;
  parameter id_19 = 1;
  nor primCall (id_4, id_13, id_19, id_3, id_1, id_17, id_0, id_18, id_14, id_8, id_7, id_5, id_12);
  module_0 modCall_1 (
      id_19,
      id_19,
      id_19,
      id_19
  );
  logic [id_11  &&  id_10  -  1 'b0 : 1  ==  1] id_20;
endmodule
