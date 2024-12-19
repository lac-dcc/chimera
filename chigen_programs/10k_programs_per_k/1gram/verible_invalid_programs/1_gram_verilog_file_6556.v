// Seed: 4027996286
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output supply1 id_2
    , id_7,
    input tri0 id_3,
    input tri0 id_4,
    output tri1 id_5
);
  tri0 id_8, id_9, id_10, id_11 = 1;
  assign id_2 = id_9;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input tri0 id_2,
    input logic id_3,
    input supply0 id_4,
    input tri1 id_5,
    input wand id_6,
    output wire id_7,
    output wire id_8,
    input tri0 id_9,
    input wor id_10,
    output logic id_11,
    input tri0 id_12,
    input supply1 id_13
    , id_16,
    input wor id_14
);
  supply1 id_17;
  uwire id_18 = id_6;
  tri0 id_19 = 1 - 1;
  always if (1) force id_11 = id_3;
  module_0 modCall_1 (
      id_4,
      id_10,
      id_1,
      id_5,
      id_0,
      id_8
  );
  assign modCall_1.id_11 = 0;
  if (1'b0) assign id_18 = id_17;
  else
    initial begin : LABEL_0
      `define pp_20 0
      id_11 <= id_16;
      id_16 <= 1;
      $display(1'h0, id_19);
      do `pp_20 = id_3; while (id_13);
    end
endmodule
