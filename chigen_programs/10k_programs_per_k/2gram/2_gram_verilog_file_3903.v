// Seed: 1622339502
module module_0 (
    input  tri1 id_0,
    output wand id_1
);
  supply0 id_3, id_4, id_5, id_6;
  wire id_7;
  assign id_3 = 1'b0;
  assign id_4 = id_6;
  wire id_8;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    output logic id_2,
    output uwire id_3,
    input tri id_4,
    output wand id_5,
    input wand id_6,
    input supply0 id_7
);
  wand  id_9;
  wire  id_10;
  uwire id_11;
  final id_2 <= 1;
  id_12(
      .id_0(1), .id_1(1), .id_2(id_9), .id_3((1))
  );
  assign id_0 = 1;
  module_0(
      id_4, id_3
  ); id_13(
      .id_0(1),
      .id_1({
        ~id_5,
        1,
        id_4#(
            .id_2(1),
            .id_3(1),
            .id_4(id_11),
            .id_5(1)
        ),
        1
      }),
      .id_6(1),
      .id_7(id_12),
      .id_8(1 + {~{id_9 - id_9{id_9}}, 1}),
      .id_9(1)
  );
endmodule
