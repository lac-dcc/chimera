// Seed: 2624129338
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri0 id_3
);
  always @(id_1 or "") begin : LABEL_0
    $unsigned(54);
    ;
  end
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1
    , id_15,
    input uwire id_2,
    output tri1 id_3,
    input wor id_4,
    output logic id_5,
    input wor id_6,
    output wor id_7,
    output logic id_8,
    inout tri id_9,
    input wire id_10,
    input wor id_11,
    output wor id_12,
    input supply1 id_13
);
  assign id_9 = -1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_12,
      id_4
  );
  assign modCall_1.id_0 = 0;
  final begin : LABEL_0
    $clog2(31);
    ;
    id_8 = id_13;
    id_5 = id_2;
  end
  wand id_16 = -1'b0;
  or primCall (id_3, id_1, id_15, id_0, id_2, id_9, id_10);
  wire id_17;
endmodule
