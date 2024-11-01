// Seed: 3682486723
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wor id_4,
    input tri1 id_5,
    output supply1 id_6,
    input tri0 id_7,
    input tri id_8,
    input tri1 id_9,
    output tri0 id_10
    , id_19,
    input uwire id_11,
    input tri1 id_12,
    input tri0 id_13,
    output wire id_14,
    input wire id_15,
    output wand id_16,
    input wand id_17
);
  assign id_16 = 1'b0;
  always_ff begin
    id_1 -= 1;
  end
  assign id_10 = id_0 || ~1;
  wire id_20;
  wire id_21;
endmodule
module module_1 (
    inout tri1 id_0,
    input tri id_1,
    output wor id_2,
    input uwire id_3,
    input wor id_4,
    input supply1 id_5,
    input tri1 id_6,
    input tri1 id_7,
    input tri1 id_8
);
  uwire id_10 = id_0;
  module_0(
      id_10,
      id_10,
      id_4,
      id_8,
      id_4,
      id_5,
      id_10,
      id_1,
      id_10,
      id_1,
      id_0,
      id_0,
      id_5,
      id_1,
      id_10,
      id_3,
      id_2,
      id_5
  );
endmodule
