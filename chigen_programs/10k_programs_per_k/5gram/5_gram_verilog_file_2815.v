// Seed: 1406431831
module module_0 (
    output uwire id_0,
    output tri   id_1
);
  wire  id_3;
  wand  id_4 = 1'b0;
  uwire id_5 = 1;
endmodule
module module_1 (
    input  tri1  id_0,
    input  uwire id_1,
    input  uwire id_2,
    input  tri0  id_3,
    input  wor   id_4,
    output uwire id_5,
    input  uwire id_6,
    input  wire  id_7,
    output tri   id_8,
    output wand  id_9,
    input  wire  id_10,
    input  uwire id_11
);
  assign id_9 = id_6;
  wire id_13;
  always_ff @(id_1 or 1'b0) begin
    fork
      #1;
    join
  end
  wire id_14;
  module_0(
      id_8, id_8
  );
endmodule
