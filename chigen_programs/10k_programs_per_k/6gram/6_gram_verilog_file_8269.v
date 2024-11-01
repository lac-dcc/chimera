// Seed: 4026271810
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    input  tri1  id_2,
    output wand  id_3
);
  id_5(
      .id_0('h0),
      .id_1(1),
      .id_2(1'b0 > 1),
      .id_3(id_1),
      .id_4(id_2 != 1),
      .id_5(id_3),
      .id_6(1),
      .id_7(id_1)
  );
  assign id_3 = 1'h0;
  reg id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17;
  always @(negedge {id_7{id_16}} == 1) begin
    if (id_0) begin
      #1;
      id_8 <= 1;
    end
    deassign id_15;
  end
endmodule
module module_1 (
    input  tri1  id_0,
    input  wor   id_1,
    input  tri   id_2,
    output uwire id_3,
    output tri   id_4
);
  wire id_6;
  module_0(
      id_2, id_0, id_2, id_3
  );
  wire id_7;
endmodule
