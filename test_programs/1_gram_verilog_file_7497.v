// Seed: 888636296
module module_0 (
    input supply0 id_0,
    input wire id_1,
    input tri1 id_2,
    input wand id_3,
    input uwire id_4
);
  assign id_6 = id_4;
  wire id_7, id_8;
  wire id_9, id_10;
  assign module_2.type_12 = 0;
endmodule
module module_1 (
    input wor id_0,
    id_2 = 1
);
  wire id_3;
  assign id_2.id_2 = -1'b0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
endmodule
macromodule module_2 (
    output tri1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wand id_4,
    input tri1 id_5,
    input tri0 id_6,
    input wand id_7,
    input tri id_8,
    output uwire id_9,
    input wire id_10,
    input supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    output supply0 id_14,
    input logic id_15,
    output supply0 id_16,
    output logic id_17
);
  final begin : LABEL_0
    id_17 <= id_6 && -1 ? id_15 : -1;
  end
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_2,
      id_2
  );
  id_19(
      .id_0(id_15), .id_1(-1)
  );
endmodule
