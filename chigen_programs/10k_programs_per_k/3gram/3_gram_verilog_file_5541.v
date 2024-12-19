// Seed: 4167378670
module module_0 (
    input  wand  id_0,
    output uwire id_1,
    output tri0  id_2,
    input  tri   id_3,
    input  tri   id_4,
    input  tri1  id_5,
    input  tri1  id_6
);
  supply0 id_8 = id_4;
  wire id_9;
  logic [7:0] id_10;
  if (id_0) begin : LABEL_0
    wire id_11;
  end
  id_12(
      .id_0(id_5), .id_1(id_8), .id_2(id_10)
  );
  assign id_10[1] = 1;
endmodule
macromodule module_1 (
    output uwire id_0,
    output wand id_1,
    input wire id_2,
    input wand id_3,
    input tri1 id_4,
    input tri id_5,
    input tri0 id_6
    , id_29,
    input wand id_7,
    output tri1 id_8,
    input tri1 id_9,
    input tri0 id_10,
    output wand id_11,
    input wand id_12,
    output uwire id_13,
    input supply1 id_14,
    input tri0 id_15,
    output tri1 id_16,
    output supply0 id_17
    , id_30,
    output wand id_18,
    input wor id_19,
    input uwire id_20,
    input uwire id_21,
    input wire id_22,
    input uwire id_23,
    input supply1 id_24,
    input tri1 id_25,
    input supply1 id_26,
    output tri1 id_27
);
  id_31(
      .id_0((id_14)), .id_1(id_22 <= id_0), .id_2(id_13), .id_3(1), .id_4(id_9), .id_5(1)
  );
  module_0 modCall_1 (
      id_6,
      id_1,
      id_13,
      id_15,
      id_10,
      id_22,
      id_25
  );
  wire id_32, id_33, id_34, id_35, id_36, id_37, id_38, id_39, id_40, id_41;
  always_latch begin : LABEL_0
    #1;
  end
endmodule
