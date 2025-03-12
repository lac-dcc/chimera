// Seed: 1079189519
module module_0 (
    input tri1 id_0,
    output supply1 module_0,
    output tri1 id_2,
    input wor id_3,
    output wor id_4,
    output uwire id_5,
    input tri1 id_6,
    output wire id_7,
    input wire id_8,
    output tri1 id_9,
    input wire id_10,
    output uwire id_11,
    input tri0 id_12
);
  localparam id_14 = 1;
  assign id_1 = id_12;
  supply1 id_15 = -1'b0;
  assign module_1.id_0 = 0;
  wire id_16;
  assign id_7 = -1;
endmodule
module module_1 #(
    parameter id_17 = 32'd2,
    parameter id_21 = 32'd22
) (
    output supply0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input wire id_3,
    input supply1 id_4,
    output logic id_5,
    input tri id_6,
    output tri0 id_7,
    output tri id_8,
    output uwire id_9,
    output tri0 id_10,
    output tri1 id_11,
    input uwire id_12,
    output wire id_13,
    output tri0 id_14,
    input wire id_15,
    input wor id_16,
    input wand _id_17,
    input supply0 id_18,
    input wand id_19,
    input tri id_20,
    input tri1 _id_21,
    output supply1 id_22,
    input tri1 id_23
);
  assign id_7 = id_18 - -1;
  wire id_25;
  assign id_10 = id_17;
  wire [id_17  |  id_21 : -1] id_26;
  module_0 modCall_1 (
      id_20,
      id_10,
      id_13,
      id_6,
      id_9,
      id_8,
      id_19,
      id_22,
      id_12,
      id_9,
      id_20,
      id_9,
      id_23
  );
  assign id_1 = -1'b0;
  always @(negedge id_23 or posedge 1) id_5 = -1;
endmodule
