// Seed: 728354056
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input tri id_2,
    output tri0 id_3,
    input tri1 id_4,
    input tri id_5,
    output wand id_6,
    output supply0 id_7,
    input tri0 id_8,
    output wire id_9,
    input uwire id_10
);
  wire id_12;
  assign id_0 = -1'b0;
  parameter id_13 = 1;
  wire id_14;
endmodule
program module_1 (
    input uwire id_0,
    input wand id_1,
    output tri id_2,
    input tri1 id_3,
    output wand id_4,
    output supply1 id_5,
    output logic id_6,
    input tri0 id_7,
    output logic id_8,
    output uwire id_9,
    input wand id_10,
    output tri1 id_11,
    output tri0 id_12
);
  assign id_11 = -1;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_1,
      id_5,
      id_1,
      id_7,
      id_9,
      id_12,
      id_10,
      id_5,
      id_1
  );
  assign modCall_1.id_5 = 0;
  wire id_14;
  final begin : LABEL_0
    id_8 <= -1;
    id_6 <= 1;
  end
  wire id_15;
endmodule
