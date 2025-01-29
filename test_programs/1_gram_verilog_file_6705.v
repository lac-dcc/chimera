// Seed: 1433415390
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output supply0 id_2,
    input wire id_3,
    output wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    input tri id_7,
    input tri0 id_8,
    id_17,
    output wire id_9,
    input supply0 id_10,
    input tri1 id_11,
    input wand id_12,
    output supply1 id_13,
    input tri1 id_14,
    input wor id_15
);
  for (id_18 = id_0; id_11 < -1'h0; id_13 = id_15) final id_17 = 1'b0;
  wor id_19 = id_15;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1
);
  if (1) assign id_1 = -1;
  else reg id_3;
  reg   id_4;
  uwire id_5 = 1;
  always begin : LABEL_0
    if (id_5) id_4 <= id_3;
    if ((-1'b0)) id_4 <= id_3;
    else;
  end
  always $display(1);
  wire id_6;
  wor id_7, id_8;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign id_5 = id_8;
  final $display;
endmodule
