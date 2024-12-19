// Seed: 857049579
module module_0 (
    input  tri   id_0,
    output tri0  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  tri   id_4,
    output tri0  id_5,
    input  wor   id_6,
    input  wand  id_7,
    input  tri0  id_8,
    input  tri   id_9,
    input  uwire id_10
);
  always @(posedge 1);
  assign module_1.type_1 = 0;
  id_12(
      .id_0(id_6),
      .id_1(id_4),
      .id_2(id_9),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6($display),
      .id_7(id_10),
      .id_8(1),
      .id_9(id_4),
      .id_10("")
  );
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    output wire id_3,
    output wand id_4,
    input tri id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri0 id_8,
    input wire id_9,
    input tri0 id_10,
    output uwire id_11,
    output tri id_12,
    input tri0 id_13
    , id_19,
    output wire id_14,
    input wire id_15,
    output uwire id_16,
    input tri1 id_17
);
  wire id_20;
  assign id_0 = ^"";
  wire id_21;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_2,
      id_8,
      id_2,
      id_3,
      id_6,
      id_15,
      id_15,
      id_10,
      id_9
  );
  always @(posedge id_15);
  assign id_21 = &1'b0 - id_17 | 1;
  wire id_22;
endmodule
