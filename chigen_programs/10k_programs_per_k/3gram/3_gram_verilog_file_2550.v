// Seed: 4276807461
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input wire id_2,
    output tri0 id_3,
    input uwire id_4,
    input uwire id_5,
    output supply1 id_6,
    output tri0 id_7,
    input uwire id_8,
    input wire id_9,
    input wor id_10,
    output tri0 id_11,
    input uwire id_12
);
  final $display(1);
  always @* for (id_0 = id_8; ~1; id_6 = 1'b0) id_3 = id_10;
  assign id_0 = id_2;
  wor id_14;
  assign id_11 = 1'b0;
  wand id_15 = 1;
  assign id_15 = 1 * 1;
  assign id_6  = id_14 | id_9;
  assign id_6  = id_8;
endmodule
module module_1 (
    output supply0 id_0
    , id_15,
    input wor id_1,
    input uwire id_2,
    output supply1 id_3,
    input wor id_4,
    input uwire id_5,
    output tri id_6,
    input wor id_7,
    input tri0 id_8,
    input tri1 id_9,
    input tri1 id_10,
    output wire id_11,
    output tri0 id_12,
    input tri1 id_13
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_4,
      id_6,
      id_9,
      id_4,
      id_0,
      id_11,
      id_1,
      id_5,
      id_9,
      id_12,
      id_7
  );
  assign modCall_1.id_4 = 0;
  always @(posedge 1) disable id_16;
endmodule
