// Seed: 3591614690
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wire id_5
);
  assign id_5 = 1 - id_3;
  assign id_5 = id_0;
  wire id_7;
  ;
  logic id_8;
  reg   id_9;
  logic id_10;
  always @(id_0 or posedge -1)
    if (1'b0) id_9 <= -1;
    else id_10 <= 1;
  assign id_10 = -1 ? id_1 : id_2;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    input tri id_2,
    output tri id_3,
    input supply0 id_4,
    input uwire id_5,
    output uwire id_6,
    output uwire id_7,
    output wire id_8,
    output tri1 id_9,
    output supply1 id_10,
    input tri1 id_11,
    output tri id_12,
    inout wand id_13,
    input supply0 id_14,
    output wand id_15,
    output wor id_16,
    input wire id_17,
    output wor id_18
);
  module_0 modCall_1 (
      id_4,
      id_13,
      id_1,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
