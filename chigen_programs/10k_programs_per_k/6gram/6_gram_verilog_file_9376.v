// Seed: 192300155
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input tri0 id_2,
    input wand id_3,
    input wand id_4,
    input tri0 id_5,
    input tri0 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input wor id_9,
    input tri id_10,
    input wire id_11,
    input uwire id_12,
    output wand id_13
);
  logic [7:0] id_15;
  assign id_13 = id_1 ? 1 : 1'b0;
  assign id_15[""] = id_12 == 1;
  assign id_15[1] = id_15;
  assign module_1.type_21 = 0;
  wire id_16;
  wire id_17;
  id_18(
      .id_0(""),
      .id_1(1 | (id_12)),
      .id_2(id_2),
      .id_3(1),
      .id_4(1'd0 <= |id_7),
      .id_5(id_16),
      .id_6(1'd0)
  );
  wire id_19;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    input tri0 id_2,
    output uwire id_3,
    input wire id_4,
    input tri1 id_5,
    input wire id_6,
    input wire id_7,
    output wor id_8,
    output tri0 id_9,
    input tri1 id_10,
    input tri id_11,
    output wor id_12,
    input tri1 id_13,
    output tri0 id_14
);
  wire id_16;
  genvar id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_5,
      id_1,
      id_5,
      id_13,
      id_1,
      id_2,
      id_7,
      id_4,
      id_2,
      id_10,
      id_12
  );
  assign id_3  = 1;
  assign id_17 = 1;
endmodule
