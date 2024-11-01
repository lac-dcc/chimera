// Seed: 1142874904
module module_0 (
    output tri0 id_0,
    output logic id_1,
    input wand id_2,
    input wire id_3,
    input uwire id_4,
    input logic id_5,
    input wor id_6,
    input wand id_7,
    input tri1 id_8,
    input wand id_9,
    input tri0 id_10,
    output tri0 id_11,
    input tri id_12,
    input supply0 id_13,
    output tri1 id_14,
    output wor id_15,
    output tri id_16,
    input uwire id_17,
    input tri0 id_18,
    output tri id_19,
    input wor id_20
);
  supply1 id_22;
  assign id_22 = id_13;
  uwire id_23 = 1;
  wire  id_24;
  wire  id_25;
  tri1 id_26, id_27, id_28;
  assign id_26 = id_18;
  initial id_1 <= id_5;
  assign id_26 = 1'b0;
  assign id_26 = 1;
endmodule
module module_1 (
    output wand  id_0,
    input  wire  id_1,
    output logic id_2
    , id_5,
    input  tri0  id_3
    , id_6
);
  logic id_7 = id_6, id_8, id_9;
  assign id_2 = id_5;
  initial begin
    id_9 <= id_5;
  end
  module_0(
      id_0,
      id_9,
      id_1,
      id_3,
      id_3,
      id_6,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1
  );
  logic id_10;
  logic id_11, id_12;
  always if (id_5) $display(id_11, id_5, 1 ? id_10.id_5 : 1, 1 ==? 1);
endmodule
