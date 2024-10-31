// Seed: 2958314913
module module_0 (
    output supply0 id_0,
    output tri1 id_1,
    output wor id_2
    , id_11,
    input tri1 id_3,
    input tri id_4,
    input wand id_5,
    output wand id_6,
    input uwire id_7
    , id_12,
    input wire id_8,
    output uwire id_9
);
  wire id_13;
endmodule
module module_1 (
    output tri0 id_0,
    output wire id_1,
    input wire id_2,
    input supply0 id_3,
    input logic id_4,
    input tri id_5,
    input tri1 id_6,
    inout logic id_7,
    input supply1 id_8,
    output uwire id_9,
    input wand id_10,
    output tri0 id_11,
    input supply1 id_12,
    input uwire id_13,
    output tri id_14,
    output logic id_15,
    input tri0 id_16,
    output wand id_17,
    output wire id_18,
    output logic id_19
);
  wire id_21;
  assign id_0 = id_4 - 1;
  always_latch @(negedge id_3) id_19 <= id_4;
  assign id_9 = id_5 == id_16;
  wire id_22;
  module_0(
      id_9, id_9, id_1, id_8, id_5, id_5, id_0, id_12, id_12, id_11
  );
  always if (~id_10 - id_16) id_15 <= id_7;
  always_ff @(negedge 1) begin
    id_19 = id_16 <= id_22;
  end
endmodule
