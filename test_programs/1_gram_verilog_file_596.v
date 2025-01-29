// Seed: 2444355417
module module_0 (
    output logic id_0,
    output tri1  id_1,
    output uwire id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    id_10,
    output tri0  id_5,
    output wire  id_6,
    input  wire  id_7,
    output wand  id_8
);
  wire id_11;
  assign id_5 = id_10;
  parameter id_12 = 1;
  wire id_13, id_14;
  always @(*) begin : LABEL_0
    id_0 <= id_12;
  end
  wire id_15;
  wire id_16;
  tri  id_17 = 1;
  wire id_18;
endmodule
module module_1 (
    input wor id_0,
    output tri0 id_1,
    input wand id_2,
    input wand id_3,
    output uwire id_4,
    output supply1 id_5,
    input supply0 id_6,
    input wand id_7,
    output logic id_8,
    input logic id_9,
    output wire id_10,
    input uwire id_11,
    input uwire id_12,
    output supply0 id_13,
    input wire id_14,
    output tri0 id_15,
    input wand id_16,
    input wand id_17,
    input wire id_18,
    output supply0 id_19,
    output tri1 id_20
);
  always
    assume (id_11)
    else id_8 <= id_9;
  wire id_22;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_1,
      id_18,
      id_14,
      id_19,
      id_4,
      id_11,
      id_19
  );
  assign modCall_1.type_0 = 0;
endmodule
