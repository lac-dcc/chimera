// Seed: 1157902490
module module_0 (
    input wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    input tri id_6,
    input supply0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input wor id_10,
    input tri0 id_11,
    output tri id_12,
    input supply1 id_13,
    output tri0 id_14,
    output wor id_15,
    output tri1 id_16
);
  wire id_18;
endmodule
module module_1 (
    output logic id_0,
    input supply0 id_1,
    input tri id_2,
    output tri id_3,
    output logic id_4,
    output supply1 id_5,
    input logic id_6
);
  assign id_0 = 1 - id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_14 = 0;
  uwire id_8;
  final begin : LABEL_0
    if (id_8) id_0 <= id_6;
    else begin : LABEL_0
      id_4 <= 1;
    end
  end
  assign id_3 = 1'b0;
  wire id_9;
  wire id_10;
  assign id_8 = 1;
  assign id_8 = id_8;
endmodule
