// Seed: 3563238299
module module_0 (
    input wor id_0,
    output tri id_1,
    output tri1 id_2,
    output uwire id_3,
    output tri id_4,
    input tri id_5,
    input wor id_6,
    output tri0 id_7,
    output tri1 id_8,
    output uwire id_9,
    input wor id_10,
    input supply1 id_11,
    output tri1 id_12,
    input tri1 id_13,
    output uwire id_14,
    input tri0 id_15,
    input tri id_16,
    input tri id_17,
    input tri id_18,
    output tri1 id_19,
    input tri1 id_20
    , id_27,
    input wire id_21,
    output wor id_22,
    input wor id_23,
    output supply0 id_24,
    input wand id_25
);
  wor id_28;
  assign id_28 = 1'b0;
endmodule
module module_1 (
    output wand  id_0,
    input  tri0  id_1,
    output tri0  id_2,
    output logic id_3,
    input  uwire id_4,
    input  tri   id_5,
    output wor   id_6
);
  wire id_8;
  module_0(
      id_1,
      id_0,
      id_6,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_6,
      id_0,
      id_4,
      id_5,
      id_6,
      id_1,
      id_2,
      id_5,
      id_5,
      id_1,
      id_5,
      id_6,
      id_4,
      id_5,
      id_0,
      id_4,
      id_0,
      id_1
  );
  wire id_9;
  if (1) begin
    always_latch @(posedge 1'b0 or 1) id_3 <= 1;
  end
endmodule
