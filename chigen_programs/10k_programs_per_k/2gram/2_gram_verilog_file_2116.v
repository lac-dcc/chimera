// Seed: 1307661953
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input tri id_2,
    output tri id_3,
    input supply1 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    input wand id_8,
    output supply1 id_9,
    inout wand id_10
);
  wire id_12;
  assign id_9 = id_7;
  assign id_5 = 1'd0;
endmodule
module module_1 (
    input  wire id_0,
    output wand id_1,
    input  wire id_2,
    input  tri0 id_3,
    output wand id_4
);
  wire id_6;
  wire id_7;
  generate
    id_8 :
    assert property (@(negedge id_0) 1'b0)
    else;
  endgenerate
  module_0(
      id_2, id_0, id_3, id_1, id_3, id_4, id_8, id_2, id_3, id_1, id_8
  );
endmodule
