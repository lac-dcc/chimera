// Seed: 72691358
module module_0 (
    output wor id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wor id_4,
    input wor id_5,
    input supply0 id_6,
    input wor id_7,
    output tri1 id_8,
    input tri1 id_9
);
  supply1 id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  always @(posedge 1 or posedge 1);
  id_16(
      id_11, id_13, 1'h0, id_5, 1, id_7, 1, 1'b0, id_2
  );
  assign id_14 = id_3;
  wire id_17;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  wor   id_4,
    input  tri0  id_5
    , id_11,
    output wand  id_6,
    input  logic id_7,
    output wire  id_8,
    input  uwire id_9
);
  assign id_8 = 1;
  module_0(
      id_0, id_2, id_1, id_9, id_9, id_1, id_4, id_9, id_3, id_2
  );
  always_latch begin
    assign id_6 = id_7;
  end
  id_12(
      .id_0(id_6), .id_1(id_2), .id_2(1)
  );
  assign id_0 = 1;
endmodule
