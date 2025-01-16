// Seed: 872764396
module module_0 (
    input tri1 id_0,
    wire id_15,
    input supply1 id_1#(.id_16("")),
    output tri0 id_2,
    input wor id_3,
    input wire id_4,
    input wand id_5,
    output tri0 id_6,
    input wand id_7,
    input tri id_8,
    output tri0 id_9,
    input tri id_10,
    output wire id_11,
    input tri0 id_12,
    output tri1 id_13
);
  wire id_17;
  wand id_18 = id_3;
  assign id_11 = id_17;
  wire id_19;
  tri  id_20;
  if (id_10) assign id_6 = id_12;
  else tri id_21 = -1;
  id_22(
      -1
  );
  localparam id_23 = -1;
  assign id_20 = 1;
  rnmos id_24 (
      .id_0(id_3),
      .id_1(id_21),
      .id_2(id_12),
      .id_3(),
      .id_4(1),
      .id_5(1 == (-1'b0)),
      .id_6(1),
      .id_7(),
      .id_8(id_22),
      .id_9(id_17 && -1'h0),
      .id_10(id_10),
      .id_11(id_10)
  );
  assign id_6 = 1'b0;
  initial $display(-1);
  wire id_25;
  wire id_26;
  uwire id_27, id_28 = 1, id_29, id_30 = 1;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    output uwire id_2,
    input wand id_3,
    input supply0 id_4,
    input tri0 id_5,
    input uwire id_6,
    input tri id_7,
    input wire id_8,
    input wor id_9,
    input uwire id_10,
    input supply1 id_11
);
  assign id_0 = id_6;
  initial $display;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_2,
      id_5,
      id_6,
      id_5,
      id_2,
      id_7,
      id_11,
      id_0,
      id_9,
      id_0,
      id_5,
      id_0
  );
  assign modCall_1.type_6 = 0;
endmodule
