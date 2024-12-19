// Seed: 2945496441
module module_0 (
    input tri id_0,
    input wire id_1,
    input wire id_2,
    output tri0 id_3,
    output supply0 id_4,
    output wire id_5,
    input wor id_6,
    output wor id_7,
    input tri id_8,
    input tri0 id_9,
    input tri id_10,
    output wor id_11,
    input tri1 id_12,
    input tri0 id_13,
    output tri id_14
    , id_20,
    input wand id_15,
    input tri id_16,
    input supply0 id_17,
    output supply0 id_18
);
  assign id_4 = 1;
  wire id_21;
  assign module_1.id_0 = 0;
  assign id_5 = id_9;
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    output tri1 id_2,
    input supply0 id_3,
    input logic id_4,
    output supply0 id_5,
    output wire id_6,
    output supply1 id_7,
    output uwire id_8
    , id_11,
    output supply1 id_9
);
  integer id_12;
  wand id_13 = 1;
  wire id_14;
  id_15(
      .id_0(id_11), .id_1(), .id_2(id_13), .id_3(1), .id_4(1'b0), .id_5(id_12)
  );
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_6,
      id_9,
      id_2,
      id_3,
      id_5,
      id_1,
      id_1,
      id_1,
      id_7,
      id_3,
      id_1,
      id_8,
      id_1,
      id_1,
      id_3,
      id_9
  );
  always @(posedge 1'b0 or negedge {1{1}}) force id_0 = id_4;
endmodule
