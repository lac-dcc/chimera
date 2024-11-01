// Seed: 827846174
module module_0 (
    output wand id_0,
    input supply0 id_1,
    output uwire id_2,
    input wor id_3,
    output wire id_4,
    output supply0 id_5,
    input tri1 id_6,
    output tri0 id_7,
    input wire id_8,
    input wire id_9,
    input supply0 id_10,
    input supply1 id_11,
    input tri0 id_12,
    input wor id_13,
    input supply0 id_14,
    output tri id_15
);
  specify
    (id_17 => id_18) = (1  : 1  : id_8, id_8  : id_12  : ~1);
    (id_19 => id_20) = 1;
    specparam id_21 = 1;
  endspecify
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output logic id_3,
    output wand id_4,
    input logic id_5
    , id_9,
    input tri id_6,
    input wor id_7
);
  assign id_3 = id_5;
  always @(negedge id_1) begin
    if (1) id_3 <= 1;
  end
  wire id_10 = id_9;
  module_0(
      id_4, id_0, id_4, id_1, id_4, id_4, id_6, id_4, id_1, id_1, id_1, id_2, id_2, id_1, id_2, id_4
  );
  logic [7:0] id_11;
  tri1 id_12 = 1;
  assign id_11[1] = id_2;
endmodule
