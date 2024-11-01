// Seed: 4071471700
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    output supply1 id_4,
    input tri id_5,
    input supply0 id_6,
    input uwire id_7,
    input supply1 id_8,
    output supply1 id_9,
    output supply1 id_10,
    output tri1 id_11
);
  rnmos ({1{1'b0}}, 1'd0, 1'b0);
  id_13(
      .id_0(id_11), .id_1(id_5), .id_2(!id_4 < 1)
  );
  reg  id_14 = 1'd0;
  wire id_15;
  always @(posedge id_5, posedge id_5) if (1) if (id_8 ^ 1) id_14 <= 1;
endmodule
module module_1 (
    input wor id_0,
    output tri id_1,
    input supply1 id_2,
    output tri id_3,
    output wand id_4,
    input wor id_5,
    output tri id_6,
    input wand id_7,
    input tri0 id_8
    , id_25,
    input tri id_9,
    input wire id_10,
    input tri0 id_11,
    input supply1 id_12,
    input wand id_13,
    output uwire id_14,
    input supply0 id_15,
    input uwire id_16,
    input wand id_17,
    input uwire id_18,
    output tri id_19,
    inout uwire id_20,
    output supply1 id_21,
    input tri id_22,
    output wire id_23
);
  logic [7:0] id_26 = id_26;
  assign id_26[1] = (id_8) ? 1'b0 : 1;
  initial begin
    id_1 = id_17;
  end
  module_0(
      id_2, id_6, id_5, id_21, id_1, id_18, id_20, id_8, id_17, id_21, id_1, id_14
  );
endmodule
