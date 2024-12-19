// Seed: 3138066360
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output supply0 id_2
);
  wor id_4;
  assign id_2 = id_4;
  assign id_4 = 1 ==? id_1;
endmodule
module module_1 (
    input wor id_0,
    output uwire id_1,
    output tri0 id_2,
    output wor id_3,
    output wor id_4
    , id_19,
    output uwire id_5,
    input wire id_6,
    output tri0 id_7,
    input supply1 id_8,
    output wand id_9,
    output uwire id_10,
    input tri1 id_11,
    output wire id_12,
    output uwire id_13,
    input logic id_14,
    output wor id_15,
    input wire id_16,
    output uwire id_17
);
  id_20(
      .id_0(id_15),
      .id_1(),
      .id_2(1),
      .id_3(id_17),
      .id_4(1),
      .id_5(1),
      .id_6(id_8),
      .id_7(1),
      .id_8(id_13),
      .id_9((id_13++)),
      .id_10(id_14),
      .id_11(1),
      .id_12(1)
  );
  tri id_21 = 1;
  reg id_22 = 1, id_23;
  wire id_24;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_13
  );
  assign modCall_1.type_1 = 0;
  id_25 :
  assert property (@(1) 1)
  else begin : LABEL_0
    id_25 <= #id_19 id_14;
    $display(1);
    id_22 <= 1;
  end
  wire id_26;
endmodule
