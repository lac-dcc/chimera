// Seed: 2469415082
module module_0 (
    input wand id_0,
    input wor id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6
    , id_8
);
  assign id_8 = id_6 && 1;
  reg id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
  if (id_12) begin
    if (1'b0) begin
      always @(posedge 1) id_12 <= id_18;
    end
  end else assign id_13 = id_10;
endmodule
macromodule module_1 (
    input  wire id_0,
    input  wire id_1,
    output tri0 id_2,
    input  wire id_3,
    output wor  id_4
);
  wire id_6, id_7;
  tri1 id_8;
  module_0(
      id_1, id_0, id_3, id_0, id_3, id_1, id_1
  ); id_9(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_3)
  );
  supply0 id_10;
  always_comb @(id_0 != id_8 or posedge id_1) id_8 = id_10;
  wire id_11;
  wire id_12;
endmodule
