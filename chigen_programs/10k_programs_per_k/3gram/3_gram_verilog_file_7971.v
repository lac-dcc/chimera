// Seed: 3310841492
module module_0 (
    input supply1 id_0,
    output supply1 id_1,
    output tri0 id_2,
    output wor id_3,
    input uwire id_4,
    input wire id_5,
    output supply1 id_6,
    output supply0 id_7,
    input wire id_8,
    input uwire id_9,
    input wand id_10,
    input wand id_11
);
  uwire id_13 = {~id_13, {id_9 - id_0, -1}, 1, 1 ? 1 : 1'd0, id_10} !== id_0;
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input wor id_2,
    input wor id_3,
    input tri0 id_4,
    input wire id_5,
    input supply1 id_6,
    input tri0 id_7,
    output logic id_8,
    input wor id_9,
    input tri1 id_10,
    input wand id_11,
    input tri0 id_12,
    input supply1 id_13,
    output supply1 id_14,
    input tri1 id_15,
    input tri id_16
);
  wire id_18;
  assign id_14 = 1;
  wire id_19;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_1,
      id_0,
      id_3,
      id_1,
      id_14,
      id_2,
      id_3,
      id_9,
      id_15
  );
  assign modCall_1.id_1 = 0;
  localparam id_20 = 1;
  always #1 begin : LABEL_0
    id_8 = 1;
  end
endmodule
