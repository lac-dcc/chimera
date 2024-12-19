// Seed: 4294292250
module module_0 (
    input wand id_0,
    input uwire id_1,
    output supply0 id_2,
    input wire id_3,
    input wor id_4,
    input tri0 id_5,
    input wand id_6,
    output uwire id_7,
    output supply0 id_8
);
  supply1 id_10;
  assign id_10 = 1;
  always @(negedge id_4) begin : LABEL_0
    {1'b0} += 1;
  end
endmodule
module module_1 (
    output supply0 id_0,
    input uwire id_1,
    output tri id_2,
    input tri1 id_3,
    output tri0 id_4,
    input tri1 id_5,
    input wire id_6,
    input tri0 id_7,
    input wor id_8,
    input supply1 id_9,
    output supply1 id_10,
    input wor id_11,
    input wor id_12,
    output wor id_13,
    output wand id_14
);
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_6,
      id_9,
      id_11,
      id_7,
      id_4,
      id_4
  );
  assign modCall_1.type_0 = 0;
  wire id_16;
  wire id_17;
  assign id_4 = id_8;
endmodule
