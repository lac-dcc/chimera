// Seed: 201965925
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wire id_5,
    input tri1 id_6,
    output tri0 id_7,
    output tri id_8,
    input tri0 id_9,
    input wand id_10,
    input wor id_11,
    input tri id_12,
    output wand id_13,
    output logic id_14,
    input supply1 id_15,
    input uwire id_16,
    input tri1 id_17,
    output wand id_18,
    input supply1 id_19,
    input supply1 id_20,
    input supply1 id_21,
    output wand id_22,
    input wire id_23
);
  uwire id_25 = id_16;
  always id_14 = #id_26 1'b0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output wire  id_2,
    inout  logic id_3,
    input  logic id_4,
    input  logic id_5,
    input  tri1  id_6
);
  assign id_3 = !id_5;
  assign id_1 = id_0 == 1;
  assign id_3 = (1'h0);
  logic id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_6,
      id_0,
      id_6,
      id_6,
      id_6,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_6,
      id_2,
      id_3,
      id_6,
      id_0,
      id_0,
      id_2,
      id_6,
      id_0,
      id_6,
      id_2,
      id_6
  );
  assign id_1 = 1;
  reg id_9;
  always @(posedge 1 or 1)
    if (1 < id_0) id_1 <= id_9;
    else begin : LABEL_0
      id_8 <= id_3;
    end
  assign id_8 = id_5;
  assign id_8 = id_4;
endmodule
