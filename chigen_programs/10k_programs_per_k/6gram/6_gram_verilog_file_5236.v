// Seed: 429847909
module module_0 (
    input wand id_0,
    input wor id_1,
    input wand id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wand id_6,
    input supply0 id_7,
    input wor id_8,
    input wor id_9,
    input wire id_10,
    output tri1 id_11,
    input tri1 id_12,
    input tri id_13,
    output tri0 id_14,
    output tri1 id_15,
    input wand id_16
);
  id_18(
      .id_0(id_9),
      .id_1(id_14#(
          .id_2(1),
          .id_3(1)
      )),
      .id_4(id_8)
  );
endmodule
module module_2 (
    input  wor  id_0,
    input  tri  id_1,
    output tri1 id_2
);
  uwire module_1 = id_1;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_7 = 0;
  tri id_4, id_5;
  assign id_4 = 1'b0;
  timeunit 1ps;
endmodule
