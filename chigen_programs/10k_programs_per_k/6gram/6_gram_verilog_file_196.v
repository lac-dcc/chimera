// Seed: 3672006217
module module_0 (
    input uwire id_0,
    input wire id_1,
    output wire id_2,
    input tri1 id_3,
    output supply1 id_4,
    input tri id_5,
    input wor id_6,
    input wand id_7,
    output tri id_8,
    output supply0 id_9,
    input tri1 id_10,
    input uwire id_11,
    input wand id_12,
    input wor id_13,
    input wand id_14,
    output tri0 id_15
);
  assign id_9 = 1;
  always @(posedge id_11 or posedge id_1) #1;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    input supply1 id_2,
    input wire id_3,
    input supply0 id_4,
    output uwire id_5
);
  logic [1 : -1  >  1 'b0] id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_5,
      id_5,
      id_3,
      id_2,
      id_4,
      id_0,
      id_1,
      id_5
  );
  assign modCall_1.id_7 = 0;
endmodule
