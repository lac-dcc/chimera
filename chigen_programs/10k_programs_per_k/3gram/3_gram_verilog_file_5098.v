// Seed: 1122366644
module module_0 (
    input tri0 id_0,
    output logic id_1,
    input wand id_2,
    output wire id_3,
    output wor id_4,
    output wand id_5,
    output tri id_6,
    output uwire id_7,
    input wand id_8,
    input tri id_9,
    input wand id_10,
    output wand id_11
    , id_16,
    input wire id_12,
    input wor id_13,
    output supply1 id_14
);
  always_latch id_1 = #1 1;
  always @(*);
  wire id_17;
  assign id_5 = id_12;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    output wire id_2,
    output supply0 id_3,
    output logic id_4,
    output tri id_5,
    output logic id_6,
    output tri1 id_7,
    input wor id_8,
    input wire id_9,
    input wand id_10,
    output wire id_11,
    input supply1 id_12,
    output tri1 id_13,
    output logic id_14,
    input tri id_15,
    output uwire id_16,
    output tri1 id_17,
    input wor id_18,
    output uwire id_19,
    output tri0 id_20,
    input tri id_21,
    output wand id_22,
    input supply1 id_23,
    input tri1 id_24,
    output tri id_25,
    input wire id_26,
    input supply1 id_27,
    output supply0 id_28,
    inout supply1 id_29
    , id_34,
    input supply1 id_30,
    input wire id_31,
    input logic id_32
);
  wire id_35;
  always @(negedge id_9) begin
    id_19 = id_12;
    id_14 <= 1;
    id_6  <= id_32;
  end
  assign id_4 = id_32;
  always @(id_16++or posedge id_1 & id_8);
  module_0(
      id_18,
      id_4,
      id_21,
      id_22,
      id_7,
      id_17,
      id_17,
      id_17,
      id_21,
      id_9,
      id_26,
      id_2,
      id_24,
      id_8,
      id_17
  );
endmodule
