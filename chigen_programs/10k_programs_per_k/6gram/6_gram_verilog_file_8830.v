// Seed: 3891706638
module module_0 (
    input wire id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output tri id_4,
    input wand id_5,
    output wor id_6
);
  wire id_8;
  wire id_9;
  assign id_6 = -1'b0 < (id_5);
  wire id_10;
  always @(posedge 1 - id_0) if (1) $unsigned(80);
  ;
endmodule
module module_1 (
    input tri1 id_0,
    output wire id_1,
    input wire id_2,
    output uwire id_3,
    input uwire id_4,
    output tri0 id_5,
    input wand id_6,
    input supply0 id_7,
    input tri id_8
);
  always @(negedge id_8 or posedge id_7 & -1) #1;
  xor primCall (id_5, id_7, id_0, id_2, id_8, id_4);
  module_0 modCall_1 (
      id_0,
      id_8,
      id_4,
      id_8,
      id_5,
      id_8,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
