// Seed: 994002251
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output tri id_2,
    output wand id_3,
    output wire id_4,
    output wand id_5,
    input tri id_6
);
  wire id_8;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    output wor id_2,
    input wire id_3,
    input supply1 id_4,
    output wor id_5,
    input tri0 id_6,
    input uwire id_7,
    output supply0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_5,
      id_8,
      id_8,
      id_5,
      id_6
  );
  assign modCall_1.id_2 = 0;
  always_latch @(posedge 1 + id_6) begin : LABEL_0
    id_1 <= 1'h0;
  end
  wire id_11;
  wire id_12;
  wire id_13;
endmodule
