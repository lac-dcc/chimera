// Seed: 4081561893
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input wand id_2,
    input tri0 id_3,
    input uwire id_4,
    input tri0 id_5,
    input wire id_6,
    input tri id_7,
    input supply0 id_8,
    input tri1 id_9,
    input supply1 id_10,
    input supply1 id_11,
    input tri0 id_12,
    output wand id_13,
    input tri1 id_14,
    output tri id_15
);
  assign id_15 = id_0;
  uwire id_17;
  wire  id_18;
  tri1  id_19;
  parameter id_20 = -1;
  assign id_17 = id_4;
  wire id_21, id_22, id_23;
  always begin : LABEL_0
    id_19 = 1;
  end
  wire id_24, id_25;
  parameter id_26 = 1;
  wire id_27, id_28, id_29, id_30;
  localparam id_31 = 1;
  wire id_32;
  assign id_22 = -1 - 1;
  assign id_13 = id_31;
  assign id_21 = -1'b0;
endmodule
module module_1 (
    input tri0 id_0
);
  assign id_2 = -1'b0;
  initial begin : LABEL_0
    id_3 <= id_2;
    id_2 <= 1;
  end
  always begin : LABEL_0
    `define pp_4 0
  end
  assign id_2 = id_2;
  wire id_5;
  time id_6 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_6,
      id_6,
      id_0,
      id_6,
      id_0,
      id_6,
      id_0,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_0,
      id_6
  );
  assign modCall_1.id_19 = 0;
  supply1 id_7;
  rpmos (
      .id_0(id_5),
      .id_1(1),
      .id_2(~1 * id_0),
      .id_3(id_2),
      .id_4(),
      .id_5(-1),
      .id_6(1'd0),
      .id_7(-1 & 1'b0),
      .id_8(~1),
      .id_9(-1),
      .id_10(1),
      .id_11(-1)
  );
  wire id_8, id_9;
  wire id_10;
  assign id_7 = 1;
  wire id_11;
  assign id_5 = id_10;
  wire id_12;
  wire id_13;
endmodule
