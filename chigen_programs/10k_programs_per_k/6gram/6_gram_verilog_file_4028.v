// Seed: 3963537288
module module_0 #(
    parameter id_19 = 32'd89,
    parameter id_20 = 32'd9
) (
    output wire id_0,
    input uwire id_1,
    input wand id_2,
    output wire id_3,
    input supply0 id_4,
    input uwire id_5,
    output supply1 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wor id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wand id_13
);
  logic [7:0] id_15;
  always @(negedge id_4) begin
    release id_13;
  end
  wire id_16;
  id_17(
      .id_0(1'b0),
      .id_1(id_2),
      .id_2(1'b0),
      .id_3(1),
      .id_4(1),
      .id_5(id_0),
      .id_6(id_15[1]),
      .id_7(1)
  ); id_18(
      .id_0(), .id_1(1), .id_2(id_10), .id_3((1))
  ); defparam id_19.id_20 = 1'b0;
endmodule
module module_1 (
    output supply1 id_0,
    input supply1 id_1,
    output tri0 id_2
);
  wire id_4;
  nand (id_0, id_6, id_5);
  always disable id_5;
  wire id_6;
  module_0(
      id_2, id_1, id_1, id_0, id_1, id_1, id_2, id_1, id_1, id_1, id_1, id_1, id_1, id_0
  );
endmodule
