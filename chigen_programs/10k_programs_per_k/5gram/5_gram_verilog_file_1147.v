// Seed: 1301018901
module module_0 (
    output tri0 id_0,
    output wor id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input wire id_5,
    input wire id_6,
    input uwire id_7,
    output tri id_8,
    output tri id_9,
    input tri0 id_10,
    input uwire id_11,
    input tri1 id_12
);
  assign id_0 = id_5;
endmodule
module module_1 (
    output wire id_0,
    input logic id_1,
    output wand module_1,
    input tri id_3,
    input uwire id_4,
    output uwire id_5,
    input tri1 id_6,
    output uwire id_7,
    output uwire id_8,
    output logic id_9,
    input logic id_10,
    output wand id_11,
    input supply1 id_12,
    input supply1 id_13
);
  wire id_15;
  tri  id_16;
  module_0(
      id_8, id_11, id_4, id_4, id_4, id_4, id_16, id_4, id_11, id_5, id_13, id_16, id_3
  );
  final begin
    id_2 = {id_12 << id_4, 1 - 1, id_16};
    id_9 <= id_10;
    $display(id_1, id_10);
  end
  always @(posedge id_16 + 1 or 1 < 1) begin
    $display(1, id_12);
    id_0 = 1;
  end
endmodule
