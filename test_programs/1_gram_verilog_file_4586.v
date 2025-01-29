// Seed: 4159320687
module module_0 (
    output wor id_0,
    input supply0 id_1,
    input supply1 id_2,
    output tri id_3
);
  assign id_3 = 1;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    output logic id_2,
    output uwire id_3,
    output wand id_4,
    output logic id_5,
    input tri1 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input tri id_9,
    input logic id_10
);
  wand id_12, id_13;
  assign id_12 = id_8;
  always begin : LABEL_0
    id_2 <= 1'b0;
    id_5 <= id_10;
  end
  wand id_14 = id_7, id_15;
  id_16(
      .id_0(-1), .id_1(1), .id_2(id_7), .id_3(!id_8)
  );
  wire id_17;
  assign id_14 = 1;
  wire id_18, id_19, id_20;
  module_0 modCall_1 (
      id_15,
      id_12,
      id_6,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
