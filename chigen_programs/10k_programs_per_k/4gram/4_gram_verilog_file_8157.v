// Seed: 2052373411
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output uwire id_4,
    output supply1 id_5,
    input supply0 id_6,
    output wand id_7,
    input supply1 id_8,
    output tri0 id_9,
    input wor id_10,
    output wor id_11
    , id_24,
    input wire id_12,
    input tri1 id_13,
    input wand id_14,
    input uwire id_15,
    input tri0 id_16,
    input wire id_17,
    output wire id_18,
    output supply1 id_19,
    input wand id_20,
    output uwire id_21,
    input wor id_22
);
  uwire id_25 = 1;
  wire  id_26;
  assign id_25 = 1'h0;
endmodule
module module_1 (
    output logic id_0,
    output uwire id_1,
    output wor id_2,
    input wire id_3,
    input uwire id_4,
    input supply0 id_5,
    input wire id_6
);
  wire id_8;
  reg  id_9;
  module_0(
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_6,
      id_1,
      id_3,
      id_2,
      id_4,
      id_1,
      id_5,
      id_6,
      id_3,
      id_6,
      id_6,
      id_4,
      id_1,
      id_1,
      id_4,
      id_2,
      id_3
  );
  always @(1) begin
    if (1) id_1 += 1;
    else id_9 <= 1;
  end
  assign id_2 = 1;
  wire id_10;
  wire id_11;
  wire id_12;
  wire id_13, id_14;
  wire id_15;
  always_latch @(negedge id_15) id_0 <= 1;
  wire id_16;
endmodule
