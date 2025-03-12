// Seed: 2646852886
module module_0 #(
    parameter id_15 = 32'd25
) (
    output wire id_0,
    output wor id_1,
    input tri0 id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input supply0 id_8,
    input wand id_9,
    output tri0 id_10,
    input wor id_11,
    output wire id_12,
    output uwire id_13
);
  wire _id_15;
  wire [-1  &  id_15 : 1] id_16;
  assign module_1.id_2 = 0;
  assign id_16 = id_3;
endmodule
module module_1 #(
    parameter id_2 = 32'd35
) (
    input supply1 id_0,
    output supply1 id_1,
    input tri1 _id_2,
    output uwire id_3
);
  wire ["" : -1 'b0 ==  id_2] id_5;
  always @(posedge id_5) #1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_3
  );
endmodule
