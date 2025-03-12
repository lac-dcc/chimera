// Seed: 859540066
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2
    , id_18,
    output wor id_3,
    output supply0 id_4,
    input uwire id_5,
    output tri1 id_6,
    output logic id_7,
    input tri0 id_8,
    input supply1 id_9,
    input tri1 id_10,
    output uwire id_11,
    input wand id_12,
    input wire id_13,
    input wor id_14,
    input wand id_15,
    input supply0 id_16
);
  always_latch @(posedge 1) begin : LABEL_0
    id_7 = !id_10;
  end
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    input wand id_2,
    input uwire id_3,
    inout supply1 id_4,
    input wand id_5,
    input tri1 id_6
);
  assign id_4 = 1 >> -1;
  always disable id_8;
  bit id_9;
  final begin : LABEL_0
    if (-1) begin : LABEL_1
      id_0 = id_8;
    end else if (-1) begin : LABEL_2
      id_9 <= id_4;
      `define pp_10 0
      `pp_10 <= id_5;
      disable id_11;
    end
  end
  wire id_12, id_13, id_14;
  wire id_15;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_1,
      id_4,
      id_4,
      id_3,
      id_4,
      id_0,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_4,
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule
