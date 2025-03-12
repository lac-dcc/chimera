// Seed: 2385193441
module module_0 ();
  wire [1 : -1] id_1 = id_1;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wand id_5,
    input wire id_6,
    output logic id_7,
    input supply0 id_8,
    input tri0 id_9,
    input uwire id_10,
    input tri0 id_11,
    inout wire id_12,
    input tri1 id_13,
    input uwire id_14,
    input supply0 id_15
);
  wire id_17;
  assign id_17 = id_6;
  nand primCall (id_12, id_13, id_14, id_15, id_17, id_2, id_3, id_4, id_5, id_6, id_8, id_9);
  always @(*) begin : LABEL_0
    id_7 <= 1;
    id_7 <= 1;
    wait (id_14 == -1 | id_8);
  end
  module_0 modCall_1 ();
endmodule
