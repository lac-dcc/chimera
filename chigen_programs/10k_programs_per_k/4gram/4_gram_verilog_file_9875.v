// Seed: 1420129827
module module_0;
  assign id_1[1] = 1;
  wire id_3;
  wire id_4;
  supply0 id_5;
  wire id_6 = ~id_5;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    input supply1 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output wire id_7,
    input logic id_8,
    input wand id_9,
    input tri id_10,
    input uwire id_11,
    input uwire id_12,
    output wor id_13,
    input wor id_14,
    input uwire id_15,
    input uwire id_16,
    output tri id_17,
    output wor id_18,
    output tri1 id_19
);
  always @(negedge id_1 or posedge 1) begin
    `define pp_21 0
    if (id_0) `pp_21 <= #1 id_8;
  end
  xor (id_13, id_14, id_15, id_16, id_2, id_4, id_8, id_9);
  module_0(); id_22(
      .id_0((1'h0)), .id_1(id_18)
  );
  wire id_23;
endmodule
