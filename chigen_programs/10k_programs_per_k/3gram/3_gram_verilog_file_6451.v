// Seed: 975975063
module module_0 (
    output uwire id_0,
    output wire id_1,
    input tri1 id_2,
    input tri0 id_3,
    output supply0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    output wire id_7#(
        .id_9 (1),
        .id_10((1)),
        .id_11(1),
        .id_12(-1),
        .id_13(1),
        .id_14(-1'b0),
        .id_15(-1)
    )
);
endmodule
module module_1 (
    input  tri   id_0,
    output logic id_1,
    input  tri0  id_2,
    output tri1  id_3,
    input  wor   id_4
);
  wire id_6, id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_2,
      id_3,
      id_0,
      id_4,
      id_3
  );
  assign modCall_1.id_7 = 0;
  always @(posedge id_0) id_1 <= -1;
endmodule
