// Seed: 2447159052
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri0 id_2,
    input tri id_3,
    input tri0 id_4,
    input wor id_5,
    input wand id_6,
    input tri0 id_7,
    input tri id_8,
    input wire id_9,
    input uwire id_10,
    input supply1 id_11,
    input tri id_12,
    input wire id_13,
    input supply0 id_14,
    input uwire id_15
    , id_20,
    input wor id_16,
    input tri id_17,
    output uwire id_18
);
  assign id_20[1'b0] = id_8 | 1;
  wire  id_21;
  wire  id_22;
  uwire id_23;
  wire  id_24;
  wire  id_25;
  wire  id_26;
  assign id_2  = (1);
  assign id_23 = id_16;
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input tri0 id_2,
    input logic id_3,
    input supply0 id_4,
    input wire id_5,
    input supply0 id_6,
    output tri id_7,
    output logic id_8,
    output supply0 id_9
);
  assign id_7 = id_4;
  always @* id_8 = #1 id_3;
  assign id_7 = 1'b0;
  tri  id_11;
  wire id_12;
  module_0(
      id_5,
      id_4,
      id_9,
      id_5,
      id_6,
      id_5,
      id_5,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_5,
      id_0,
      id_0,
      id_0,
      id_5,
      id_5,
      id_7
  );
  wire id_13;
  assign id_11 = 1;
endmodule
