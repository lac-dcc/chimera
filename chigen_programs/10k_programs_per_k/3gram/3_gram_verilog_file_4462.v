// Seed: 1862693989
module module_0 (
    input  tri1  id_0,
    input  wire  id_1
    , id_6,
    output wand  id_2,
    input  uwire id_3,
    input  wor   id_4
);
  always_comb @(id_4 & 1 or posedge 1);
  wire id_7;
endmodule
module module_1 (
    output wand  id_0,
    input  wand  id_1,
    input  uwire id_2,
    output tri0  id_3,
    input  wire  id_4
);
  wor id_6 = {1'b0, id_4};
  module_0(
      id_2, id_6, id_0, id_1, id_2
  );
  assign id_0 = id_6;
  wire id_7;
  assign id_3 = id_1 && id_2;
  wor  id_8;
  wire id_9;
  id_10(
      .id_0(id_0),
      .id_1(1),
      .id_2(id_2),
      .id_3(id_6),
      .id_4(id_9),
      .id_5(1),
      .id_6(1),
      .id_7(id_3),
      .id_8(id_0)
  );
  always_latch @(id_1 or posedge id_1) begin
    #1;
    foreach (id_11[1]) begin
      if (id_8) id_10 = ~1;
      if (1) begin
        $display;
      end
    end
    id_9 = id_9;
  end
  tri  id_12 = 1;
  wire id_13;
endmodule
