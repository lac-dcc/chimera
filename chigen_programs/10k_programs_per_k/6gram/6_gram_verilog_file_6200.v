// Seed: 3412606042
module module_0 (
    output wor   id_0,
    input  wor   id_1,
    output uwire id_2,
    input  tri   id_3
);
  wire id_5;
  wire id_6;
  assign id_0 = 1;
endmodule
module module_1 (
    output wor   id_0,
    output wire  id_1,
    input  uwire id_2,
    output logic id_3
);
  always @(id_2 or posedge 1) begin : LABEL_0
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_2
  );
endmodule
module module_2 (
    output tri1 id_0,
    input supply1 id_1,
    input wand id_2,
    input wor id_3,
    output supply0 id_4,
    input wand id_5,
    input uwire id_6,
    input wand id_7,
    input tri1 id_8,
    output wor id_9,
    input uwire id_10,
    input supply1 id_11,
    input tri id_12,
    input wor id_13,
    output tri0 id_14
);
  id_16(
      .id_0(id_13), .id_1(1), .id_2(1), .id_3((1)), .id_4(""), .id_5(1)
  );
  module_0 modCall_1 (
      id_9,
      id_10,
      id_14,
      id_5
  );
endmodule
