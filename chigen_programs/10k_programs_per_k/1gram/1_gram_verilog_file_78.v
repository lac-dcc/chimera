// Seed: 410508422
module module_0 (
    output wor id_0,
    output supply1 id_1,
    input supply1 id_2,
    input wand id_3,
    input wor id_4,
    output wor id_5
);
  uwire id_7;
  assign id_5 = 1'h0;
  wire id_8;
  wire id_9;
  always id_7 = 1'b0;
  wire id_10;
  wire id_11, id_12, id_13;
  wire id_14, id_15;
  assign module_1.id_14 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output wire id_1,
    input tri1 id_2,
    input wire id_3,
    output wand id_4,
    output logic id_5,
    input tri id_6,
    input tri id_7,
    output tri0 id_8,
    output tri id_9,
    output uwire id_10,
    input logic id_11,
    input tri1 id_12,
    output logic id_13,
    output supply1 id_14,
    input tri0 id_15,
    input logic id_16,
    output tri id_17,
    input wire id_18,
    input uwire id_19
);
  always deassign id_9;
  always @(negedge 1 or posedge id_12)
    if (1) id_5 <= id_16;
    else cover (1) id_13 <= id_11;
  module_0 modCall_1 (
      id_14,
      id_1,
      id_2,
      id_7,
      id_6,
      id_17
  );
endmodule
