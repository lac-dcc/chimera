// Seed: 2696152868
module module_0 (
    output wire id_0
    , id_9,
    input uwire id_1,
    input tri0 id_2,
    input tri0 id_3,
    output supply1 id_4,
    output wor id_5
    , id_10,
    input wand id_6,
    output supply1 id_7
);
  wire id_11;
  assign id_7 = id_9 & -1'b0;
  specify
    $width(negedge id_12, -1);
    (id_13 => id_14) = 1;
  endspecify
  assign id_7 = -1;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wire id_4,
    input tri id_5,
    output logic id_6,
    input wire id_7,
    output wand id_8,
    input tri1 id_9,
    output logic id_10
);
  wire id_12;
  always @(-1) begin : LABEL_0
    id_6  <= id_4;
    id_10 <= -1;
  end
  module_0 modCall_1 (
      id_8,
      id_4,
      id_9,
      id_5,
      id_0,
      id_8,
      id_5,
      id_8
  );
  assign modCall_1.id_6 = 0;
endmodule
