// Seed: 2853892726
module module_0 (
    input  wor   id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  tri   id_4,
    input  wor   id_5,
    input  wor   id_6,
    output uwire id_7
);
  assign id_7 = 1;
  reg id_9;
  always_ff id_9 <= 1;
  always begin
    if (id_1 === 1'b0) id_9 <= 1;
  end
endmodule
module module_1 (
    input  tri0  id_0,
    output tri   id_1,
    input  wor   id_2,
    input  wor   id_3,
    output uwire id_4,
    input  wire  id_5,
    output tri   id_6,
    inout  wand  id_7,
    input  uwire id_8
);
  wire id_10;
  module_0(
      id_5, id_5, id_7, id_8, id_8, id_5, id_0, id_1
  );
endmodule
