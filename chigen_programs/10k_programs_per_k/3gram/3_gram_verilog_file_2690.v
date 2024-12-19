// Seed: 1111673039
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input wire id_2,
    input supply1 id_3,
    input tri id_4,
    output wand id_5,
    output wire id_6,
    input wor id_7
);
  id_9(
      .id_0(1),
      .id_1(id_0),
      .id_2(id_2),
      .id_3(id_2),
      .id_4(id_2),
      .id_5(id_7),
      .id_6(1),
      .id_7(1'h0)
  );
endmodule
module module_1 (
    input  wand  id_0,
    output tri1  id_1,
    output logic id_2,
    output tri0  id_3,
    input  wire  id_4,
    input  wand  id_5,
    input  wire  id_6,
    input  tri0  id_7,
    input  wand  id_8,
    input  tri0  id_9,
    output tri   id_10
);
  assign id_3 = id_9;
  module_0 modCall_1 (
      id_0,
      id_7,
      id_7,
      id_9,
      id_7,
      id_1,
      id_10,
      id_8
  );
  assign id_3 = 1;
  always @(negedge id_5) begin : LABEL_0
    id_2 <= 1;
    id_10 = 1;
  end
endmodule
