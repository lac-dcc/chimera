// Seed: 1452363304
module module_0;
  always @(id_1 or negedge 1) begin : LABEL_0
    disable id_2;
    fork
      id_3("");
    join
  end
  assign module_1.type_24 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    output wor id_2,
    input uwire id_3,
    output supply1 id_4,
    output wand id_5,
    input wor id_6,
    output wire id_7,
    input wand id_8
    , id_19,
    input supply0 id_9
    , id_20,
    output tri0 id_10,
    input uwire id_11,
    input tri id_12,
    input supply1 id_13,
    input wire id_14,
    output tri0 id_15,
    input supply0 id_16,
    input uwire id_17
);
  assign id_5  = id_20 == 1'b0;
  assign id_19 = !id_0;
  wire id_21;
  module_0 modCall_1 ();
  assign id_20 = (id_1);
endmodule
