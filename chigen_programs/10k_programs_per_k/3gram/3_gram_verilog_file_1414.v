// Seed: 222664961
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    output wor id_4,
    input supply0 id_5
);
  always @* if (-1'b0) assign id_4 = id_5 == 1'b0;
  assign id_4 = -1'd0;
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    input tri1 id_2,
    input wire id_3,
    input wand id_4,
    input tri0 id_5,
    output logic id_6,
    input supply0 id_7,
    output tri0 id_8,
    input tri1 id_9,
    input supply1 id_10,
    output tri0 id_11,
    input wand id_12,
    input wor id_13,
    input tri0 id_14,
    output wire id_15,
    input supply0 id_16
);
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_16,
      id_4,
      id_2,
      id_8,
      id_13
  );
  assign modCall_1.id_5 = 0;
  always id_6 = #1 id_10;
endmodule
