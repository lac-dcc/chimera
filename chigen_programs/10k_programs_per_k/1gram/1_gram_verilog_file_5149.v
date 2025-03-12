// Seed: 1058857321
module module_0 (
    input tri id_0,
    input uwire id_1,
    input tri id_2,
    input supply1 id_3,
    output wire id_4,
    output logic id_5,
    output supply1 id_6
);
  wire id_8, id_9, id_10, id_11;
  logic id_12;
  logic id_13 = 1;
  logic id_14, id_15;
  final id_5 = -1;
  wire id_16;
endmodule
module module_1 #(
    parameter id_3 = 32'd51,
    parameter id_4 = 32'd24,
    parameter id_6 = 32'd10
) (
    input wand id_0[1 : {  -1  ?  1 : id_6  ,  id_3  }],
    output logic id_1,
    inout tri0 id_2,
    input supply0 _id_3,
    input tri0 _id_4,
    input wand id_5,
    output tri _id_6,
    output tri1 id_7[1 : id_4],
    input supply0 id_8
    , id_13,
    output wor id_9,
    input uwire id_10,
    output tri1 id_11
);
  always @(*);
  xnor primCall (id_7, id_10, id_0, id_13, id_8, id_5, id_2);
  module_0 modCall_1 (
      id_10,
      id_5,
      id_2,
      id_2,
      id_2,
      id_1,
      id_7
  );
  always id_1 = -1'd0;
endmodule
