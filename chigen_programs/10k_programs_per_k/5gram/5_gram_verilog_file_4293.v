// Seed: 3565411446
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output wor id_2,
    input tri0 id_3,
    input wor id_4,
    output tri module_0,
    output supply1 id_6,
    input uwire id_7,
    input supply1 id_8,
    input wire id_9,
    input tri1 id_10,
    input uwire id_11,
    output supply1 id_12,
    input wor id_13,
    input tri id_14,
    output tri0 id_15
);
  uwire id_17;
  wire  id_18;
  wire  id_19;
  generate
    assign id_17 = id_3;
  endgenerate
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output wor id_2,
    output logic id_3,
    input wor id_4,
    output uwire id_5,
    output supply1 id_6,
    input logic id_7,
    output wor id_8
);
  always @(negedge id_8++) $display;
  assign id_1 = id_0;
  module_0(
      id_0, id_0, id_1, id_0, id_4, id_5, id_6, id_0, id_0, id_0, id_4, id_0, id_5, id_4, id_0, id_1
  );
  initial begin
    id_1 = 1'b0 | id_0 | 1;
    id_3 <= 1;
  end
  always_comb force id_5 = id_7;
  assign id_3 = 1;
endmodule
