// Seed: 3181136539
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    output wor id_3,
    input tri id_4,
    input tri0 id_5,
    output wand id_6,
    input tri1 id_7,
    input wand id_8
);
  assign id_3 = 1'b0;
  assign id_0 = id_2;
  assign id_0 = id_5;
  assign module_1.id_5 = 0;
  id_10(
      .id_0(-1 * -1), .id_1(id_7), .id_2(id_7), .id_3(1), .id_4(id_8)
  );
  assign id_6 = id_5.id_7 - {id_5};
  assign id_3 = 1;
  parameter id_11 = -1;
  assign id_3 = id_5;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    output wor id_2,
    input tri0 id_3,
    input uwire id_4,
    input logic id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wire id_8
);
  id_10 :
  assert property (@(posedge -1 or id_5 ? -1 : -1) id_8) @(posedge -1'b0 + (-1)) id_0 <= id_5;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_2,
      id_4,
      id_8,
      id_10,
      id_1,
      id_10
  );
endmodule
