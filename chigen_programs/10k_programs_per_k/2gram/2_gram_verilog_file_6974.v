// Seed: 916407141
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    output wand id_2,
    output wand id_3,
    output tri0 id_4,
    input wand id_5,
    output tri id_6,
    input wire id_7,
    input supply0 id_8,
    output tri1 id_9,
    output wor id_10,
    input tri id_11,
    output wire id_12,
    output uwire id_13,
    output wand id_14,
    input tri0 id_15,
    input tri0 id_16,
    input tri1 id_17,
    input uwire id_18,
    input wor id_19,
    output uwire id_20,
    input tri0 id_21,
    output tri id_22,
    input wor id_23,
    output supply1 id_24,
    input uwire id_25,
    input tri1 id_26,
    output wire id_27,
    input supply1 id_28,
    output wor id_29,
    output wor id_30,
    output supply1 id_31,
    input tri0 id_32
    , id_37,
    output wor id_33,
    output tri id_34,
    output supply1 id_35
);
  assign id_35 = {id_8, 1};
  wire id_38;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output tri1 id_2,
    input supply1 id_3
    , id_8, id_9,
    input wire id_4
    , id_10,
    output wor id_5,
    input tri0 id_6
);
  genvar id_11;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_0,
      id_0,
      id_0,
      id_1,
      id_5,
      id_3,
      id_3,
      id_5,
      id_2,
      id_4,
      id_5,
      id_2,
      id_5,
      id_3,
      id_6,
      id_6,
      id_3,
      id_1,
      id_0,
      id_1,
      id_2,
      id_3,
      id_5,
      id_1,
      id_4,
      id_0,
      id_6,
      id_0,
      id_2,
      id_0,
      id_3,
      id_0,
      id_2,
      id_5
  );
  assign modCall_1.id_26 = 0;
  tri0 id_12;
  wire id_13;
  wand id_14;
  wire id_15;
  wire id_16;
  assign id_14 = 1;
  wire id_17;
  tri0 id_18;
  assign id_18 = 1;
  if (1) begin : LABEL_0
    assign id_11 = id_11;
  end
  id_19(
      .id_0(), .id_1(1), .id_2(1), .id_3((1)), .id_4(1'b0), .id_5(id_14)
  );
  wire id_20;
  assign id_2 = id_3 == id_11;
  wire id_21;
  assign id_5 = !1;
endmodule
