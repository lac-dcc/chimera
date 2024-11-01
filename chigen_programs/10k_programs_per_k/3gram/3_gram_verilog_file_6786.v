// Seed: 824406646
module module_0 (
    input uwire id_0,
    input tri id_1,
    input wand id_2,
    output tri1 id_3,
    output wor id_4,
    output tri0 id_5,
    output uwire id_6,
    output uwire id_7,
    input uwire id_8,
    input wire id_9,
    output uwire id_10,
    input uwire id_11,
    input wand id_12,
    output supply1 id_13,
    input supply1 id_14,
    input tri id_15,
    output uwire id_16,
    output tri0 id_17
);
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1,
    input wire id_2,
    input wire id_3
    , id_22,
    input wor id_4,
    output wand id_5,
    input supply0 id_6,
    input logic id_7,
    output tri0 id_8,
    input supply1 id_9,
    input tri0 id_10,
    output logic id_11,
    input tri0 id_12,
    input tri1 id_13,
    output tri0 id_14,
    output tri id_15,
    output wand id_16,
    input tri id_17,
    input tri1 id_18,
    input supply1 id_19,
    output tri1 id_20
);
  wire id_23;
  assign id_23 = id_12;
  xor (id_1, id_10, id_23, id_4, id_13, id_19, id_12, id_7, id_3, id_9, id_22, id_2, id_17);
  module_0(
      id_19,
      id_10,
      id_19,
      id_20,
      id_1,
      id_0,
      id_14,
      id_20,
      id_19,
      id_9,
      id_14,
      id_3,
      id_18,
      id_14,
      id_6,
      id_17,
      id_14,
      id_1
  );
  assign id_1 = 1;
  wire id_24;
  wire id_25;
  always @(posedge id_22) begin
    id_11 <= id_7;
  end
  always @(1 or posedge 1 - id_6);
endmodule
