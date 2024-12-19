// Seed: 477812490
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input uwire id_2,
    output tri0 id_3,
    input tri id_4
    , id_9,
    input wor id_5,
    input tri0 id_6,
    input tri0 id_7
);
  timeunit 1ps / 1ps;
endmodule
module module_1 (
    output wor id_0,
    output wor id_1,
    input wire id_2,
    input tri0 id_3,
    input wand id_4,
    input wor id_5,
    input supply0 id_6,
    input wor id_7,
    output wor id_8,
    input supply0 id_9,
    input tri1 id_10,
    output supply1 id_11,
    input tri0 id_12,
    output supply0 id_13,
    input tri id_14,
    input tri1 id_15,
    input tri0 id_16,
    output tri0 id_17
);
  id_19(
      .id_0(1'b0), .id_1(id_2), .id_2(id_12)
  );
  module_0 modCall_1 (
      id_0,
      id_10,
      id_6,
      id_17,
      id_3,
      id_3,
      id_4,
      id_9
  );
  assign modCall_1.type_11 = 0;
  id_20 :
  assert property (@(negedge 1'h0) id_15)
  else $display(id_3 ^ id_9);
endmodule
