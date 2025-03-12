// Seed: 60860214
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    output logic id_2,
    output uwire id_3,
    input tri0 id_4,
    input supply0 id_5,
    output tri id_6,
    input tri1 id_7,
    input wand id_8,
    input uwire id_9,
    input wand id_10,
    input uwire id_11,
    input tri id_12,
    output tri1 id_13,
    input wand id_14,
    output supply1 id_15,
    input wand id_16,
    input wire id_17,
    input supply0 id_18,
    output uwire id_19,
    input wire id_20,
    input wor id_21,
    input uwire id_22,
    input supply1 id_23,
    output wand id_24,
    input wor id_25,
    input supply0 id_26,
    output uwire id_27,
    output supply0 id_28,
    input tri id_29,
    output supply1 id_30,
    input tri id_31,
    output supply1 id_32,
    output uwire id_33
);
  assign id_27 = ~id_29;
  assign id_24 = id_5 + id_12 + id_31 + -1 + 1'd0 + -1'h0 + id_11 + 1 + id_16 + id_22 + id_5 - 1;
  wire id_35;
  assign module_1.id_4 = 0;
  always @((1 == -1'b0)) begin : LABEL_0
    if (1) id_2 <= -1;
    else $clog2(8);
    ;
  end
endmodule
module module_1 (
    output wire  id_0,
    input  wand  id_1,
    input  wor   id_2,
    inout  logic id_3,
    input  uwire id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  tri0  id_7,
    input  wor   id_8,
    output tri   id_9
);
  logic id_11;
  wire  id_12;
  always @(1 or posedge id_11[1>-1]) begin : LABEL_0
    id_3 = 1'b0 == id_3;
  end
  module_0 modCall_1 (
      id_9,
      id_4,
      id_3,
      id_0,
      id_6,
      id_5,
      id_9,
      id_7,
      id_1,
      id_8,
      id_2,
      id_1,
      id_5,
      id_0,
      id_5,
      id_0,
      id_5,
      id_8,
      id_8,
      id_0,
      id_2,
      id_7,
      id_2,
      id_1,
      id_9,
      id_5,
      id_1,
      id_9,
      id_9,
      id_7,
      id_9,
      id_6,
      id_0,
      id_0
  );
endmodule
