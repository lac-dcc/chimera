// Seed: 4197397561
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2,
    output tri1 id_3,
    output wand id_4,
    input tri0 id_5,
    input wand id_6,
    input tri id_7,
    output supply0 id_8,
    input tri1 id_9,
    output wor id_10
    , id_20,
    input tri id_11,
    output wire id_12,
    input uwire id_13,
    input wand id_14,
    output tri0 id_15,
    output tri0 id_16,
    input tri0 id_17,
    input wire id_18
);
  assign id_16 = 1;
endmodule
module module_1 (
    input  uwire id_0
    , id_4,
    input  tri0  id_1,
    output wor   id_2
);
  wire id_5;
  assign id_5 = id_4.id_4[1];
  wire id_7;
  wire id_8;
  wor id_9;
  supply1 id_10;
  wire id_11;
  id_12 :
  assert property (@(1) id_0.id_9(1) | 1 | id_10)
  else;
  wire id_13;
  assign id_13 = id_7;
  id_14(
      .id_0(id_5), .id_1(1), .id_2(id_6), .id_3(id_12)
  );
  always #id_15 begin
    return 1'b0;
  end
  tri  id_16 = 1;
  wire id_17;
  module_0(
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_0
  );
  assign id_15 = 1'd0;
endmodule
