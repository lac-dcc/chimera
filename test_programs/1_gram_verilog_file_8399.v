// Seed: 3005176659
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    output wire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output wor id_5,
    output tri1 id_6,
    output tri1 id_7,
    id_14,
    input wand id_8,
    input supply1 id_9,
    output tri id_10,
    output supply1 id_11,
    output uwire id_12
);
  wire id_15;
  id_16 :
  assert property (@(posedge id_4) id_0) @(-1) id_6 = id_9;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input tri id_2,
    input supply1 id_3,
    input tri1 id_4,
    input tri1 id_5,
    output wor id_6,
    id_42,
    input tri1 id_7,
    input uwire id_8,
    output tri id_9,
    input tri id_10,
    input wor id_11,
    input tri0 id_12,
    output tri id_13,
    input tri1 id_14,
    input tri1 id_15,
    output uwire id_16,
    output tri0 id_17,
    input tri id_18,
    input tri id_19,
    output supply0 id_20,
    output wor id_21,
    output tri0 id_22,
    input supply1 id_23,
    input supply0 id_24,
    input wire id_25,
    output wire id_26,
    input uwire id_27,
    input supply0 id_28,
    input wand id_29,
    output tri0 id_30,
    input wor id_31,
    input wire id_32,
    input supply0 id_33,
    output tri1 id_34,
    input uwire id_35,
    input tri1 id_36,
    output tri1 id_37,
    input wire id_38,
    input wor id_39,
    input wor id_40
);
  id_43(
      .id_0(id_39),
      .id_1(id_28),
      .id_2(id_8),
      .id_3(-1),
      .id_4(-1),
      .id_5(-1),
      .id_6($realtime),
      .id_7(-1 == 1 + id_40)
  );
  assign id_6 = 1;
  module_0 modCall_1 (
      id_40,
      id_40,
      id_16,
      id_36,
      id_36,
      id_22,
      id_0,
      id_17,
      id_25,
      id_5,
      id_30,
      id_22,
      id_17
  );
  assign modCall_1.id_5 = 0;
endmodule
