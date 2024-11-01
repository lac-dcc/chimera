// Seed: 150926163
module module_0 (
    output tri0  id_0,
    input  uwire id_1,
    input  wire  id_2,
    input  tri0  id_3,
    output wand  id_4,
    input  wand  id_5
);
  id_7(
      .id_0(1),
      .id_1(id_3),
      .id_2(1),
      .id_3(),
      .id_4(1),
      .id_5(),
      .id_6(id_3),
      .id_7(id_3 >= id_1),
      .id_8(id_2),
      .id_9(id_1)
  );
endmodule
module module_1 (
    input  wand  id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  tri1  id_3,
    output logic id_4,
    input  wire  id_5
);
  always
    repeat (1)
      @(posedge id_3) begin
        id_4 <= 1 + 1;
      end
  module_0(
      id_2, id_0, id_0, id_1, id_2, id_3
  );
endmodule
