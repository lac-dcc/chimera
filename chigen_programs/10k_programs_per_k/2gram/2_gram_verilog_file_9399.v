// Seed: 2107394690
module module_0 (
    input wor id_0,
    output wire id_1,
    input wand id_2,
    output supply0 id_3,
    input wand id_4,
    output tri id_5,
    output tri1 id_6,
    input wire id_7,
    output tri0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply1 id_11,
    output tri0 id_12,
    input tri0 id_13,
    output tri1 id_14,
    output tri0 id_15,
    output logic id_16
);
  wire id_18 = id_13;
  always id_16 = -1;
  assign id_8 = -1'd0;
  assign id_1 = -1'b0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input uwire id_2,
    output logic id_3,
    input supply0 id_4,
    output tri id_5,
    output tri id_6,
    output supply1 id_7
    , id_10,
    input wor id_8
);
  always_latch begin : LABEL_0
    id_3 = id_8;
  end
  assign id_6 = id_2;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_6,
      id_4,
      id_5,
      id_6,
      id_1,
      id_7,
      id_1,
      id_1,
      id_6,
      id_5,
      id_1,
      id_5,
      id_6,
      id_3
  );
  assign modCall_1.id_15 = 0;
endmodule
