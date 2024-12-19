// Seed: 2068907197
module module_0 (
    input tri0 id_0,
    output wire id_1,
    output wire id_2,
    input wire id_3,
    output wire id_4,
    output tri0 id_5,
    input supply0 id_6,
    input wor id_7,
    output tri0 id_8,
    input supply1 id_9,
    input wor id_10,
    input supply1 id_11,
    output wand id_12,
    input wor id_13,
    input wor id_14,
    output uwire id_15,
    output tri1 id_16,
    input wand id_17
);
  id_19(
      id_15
  );
  wire id_20;
  if (id_0) assign id_4 = 1 | {id_3{1}};
  assign module_1.type_15 = 0;
  uwire id_21 = 1, id_22;
endmodule
module module_1 (
    output tri id_0,
    input wand id_1,
    output wor id_2,
    output tri id_3,
    input tri1 void id_4,
    input supply1 id_5,
    output supply0 id_6,
    input supply1 id_7
);
  wire id_9;
  wire id_10;
  wire id_11, id_12;
  if (id_11) wire id_13;
  assign id_0 = 1'd0;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_2,
      id_4,
      id_6,
      id_3,
      id_7,
      id_5,
      id_3,
      id_7,
      id_1,
      id_1,
      id_0,
      id_7,
      id_7,
      id_6,
      id_6,
      id_7
  );
  always $display;
endmodule
