// Seed: 1239530313
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output wand id_3,
    input wire id_4,
    input tri0 id_5,
    input wor id_6,
    input tri1 id_7,
    output tri1 id_8,
    output wor id_9,
    input wand id_10,
    output tri1 id_11
);
  wire id_13;
  assign module_1.id_3 = 0;
  always @(id_10 or negedge id_7) begin : LABEL_0
    disable id_14;
  end
endmodule
module module_1 (
    output logic id_0,
    input wand id_1,
    input supply0 id_2,
    output tri1 id_3,
    input wor id_4,
    output uwire id_5,
    input wor id_6
);
  always @(posedge id_1) begin : LABEL_0
    id_0 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_6,
      id_3,
      id_6,
      id_2,
      id_1,
      id_1,
      id_5,
      id_5,
      id_2,
      id_3
  );
  id_8(
      .id_0(1), .id_1(1)
  ); id_9(
      .id_0(-id_4), .id_1(id_5), .id_2(1), .id_3(id_4 ^ id_2), .id_4(id_2), .id_5(id_3)
  ); id_10(
      .id_0(""), .id_1(1 == id_6), .id_2(id_4), .id_3(1), .id_4(1), .id_5("")
  );
endmodule
