// Seed: 1084076864
module module_0 ();
  reg id_1;
  reg id_2;
  always_ff @(id_2 - 1 or posedge id_1) begin : LABEL_0
    id_2 = id_1;
    id_2 <= id_2;
  end
endmodule
module module_1 (
    input wire  id_0,
    input uwire id_1,
    input uwire id_2
);
  wor id_4 = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.type_4 = 0;
endmodule
module module_2 (
    output wire id_0,
    input uwire id_1,
    input wor id_2,
    output supply1 id_3,
    output uwire id_4,
    input uwire id_5,
    input supply0 id_6,
    output wand id_7,
    output tri1 id_8,
    input tri0 id_9,
    input tri id_10,
    input tri1 id_11,
    output wand id_12,
    output wand id_13,
    input tri1 id_14,
    input supply1 id_15,
    output tri1 id_16,
    input wire id_17,
    output wire id_18
);
  logic [7:0] id_20;
  id_21(
      .id_0(id_20[1'd0]),
      .id_1(1),
      .id_2(id_10),
      .id_3(1),
      .id_4(1),
      .id_5(id_3),
      .id_6(id_17 - 1),
      .id_7(id_18),
      .id_8(1),
      .id_9(1),
      .id_10(""),
      .id_11(""),
      .id_12(1'd0)
  );
endmodule
module module_3 (
    input tri0 id_0
    , id_13,
    input wor id_1,
    input tri1 id_2,
    output wire id_3,
    input wire id_4,
    output supply0 id_5,
    input wand id_6,
    input tri1 id_7,
    output wire id_8,
    output supply0 id_9,
    input wand id_10,
    input tri1 id_11
);
  assign id_5 = id_0;
  module_2 modCall_1 (
      id_8,
      id_11,
      id_1,
      id_5,
      id_8,
      id_4,
      id_7,
      id_9,
      id_3,
      id_6,
      id_1,
      id_0,
      id_3,
      id_8,
      id_4,
      id_7,
      id_9,
      id_7,
      id_8
  );
  assign modCall_1.id_13 = 0;
endmodule
