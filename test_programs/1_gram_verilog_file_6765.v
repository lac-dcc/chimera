// Seed: 2742683583
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_10 = id_6;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  uwire id_2;
  always
  `define pp_3 0
  assign id_2 = ^1;
  uwire id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4
  );
  assign id_2 = 1;
  assign id_2 = ~id_1;
  if ((-1'h0)) assign id_1 = 1;
  else
    id_5(
        .id_0(-1),
        .id_1(1'b0),
        .id_2(`pp_3),
        .id_3(id_1),
        .id_4({1'b0 & id_2}),
        .id_5(-1),
        .id_6({`pp_3, id_4, -1, `pp_3}),
        .id_7(1 && `pp_3)
    );
endmodule
