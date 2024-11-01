// Seed: 3124449031
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    input wand id_5,
    input tri1 id_6,
    output wand id_7
    , id_10,
    output uwire id_8
);
  tri1 id_11, id_12;
  id_13(
      1, 1, 1 - 1, 1
  );
  assign id_8  = 1;
  assign id_10 = id_5;
  wire id_14 = 1;
  id_15(
      id_11 ? id_12 : 1, id_4, 1, id_14
  );
  tri1 id_16 = id_5;
  wand id_17 = 1'h0 * 1;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    output tri1  id_2,
    input  tri0  id_3,
    output wire  id_4,
    input  wire  id_5,
    input  logic id_6,
    output tri   id_7,
    input  tri   id_8,
    output wire  id_9,
    output logic id_10,
    input  uwire id_11
);
  wor id_13;
  assign id_2 = 1;
  reg id_14;
  module_0(
      id_2, id_8, id_5, id_11, id_5, id_8, id_11, id_9, id_4
  );
  assign id_2 = id_8 - id_11;
  always id_14 = 1;
  id_15(
      .id_0(id_3), .id_1(id_5), .id_2(1'b0)
  );
  always begin
    if (id_5) id_1 <= id_6;
    if (id_13) id_10 <= 1;
    id_14 <= id_6;
  end
endmodule
