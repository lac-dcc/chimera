// Seed: 2386915325
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input wire id_2,
    input supply0 id_3,
    inout tri1 id_4,
    input wand id_5
);
  always_ff id_4 = id_2;
  assign id_4 = 1;
endmodule
program module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri1 id_3,
    output tri0 id_4,
    input logic id_5,
    input tri id_6,
    input supply1 id_7,
    input wire id_8,
    output tri1 id_9,
    input uwire id_10,
    output wand id_11,
    output logic id_12,
    input supply0 id_13,
    output tri0 id_14,
    input wand id_15,
    output tri id_16,
    input wire id_17,
    input wor id_18
);
  tri1 id_20;
  assign id_4 = id_20;
  wire id_21;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_7,
      id_8,
      id_20,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_9 = -1 == ~id_2;
  assign id_9 = 1'h0;
  wire id_22;
  always
    if (id_15)
      #id_23
        if (id_15) begin : LABEL_0
          id_16 = -1;
        end else id_12 <= id_5;
  assign id_4 = id_7;
  wire id_24, id_25;
  wire id_26;
  and primCall (id_9, id_0, id_2, id_10, id_7, id_1, id_21, id_5, id_13, id_6, id_20);
  parameter id_27 = -1;
  parameter id_28 = "";
endmodule
