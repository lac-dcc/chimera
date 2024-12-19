// Seed: 2789612362
module module_0 (
    input wor id_0,
    output wire id_1,
    input wand id_2,
    output tri id_3,
    output uwire id_4,
    input uwire id_5,
    output supply0 id_6,
    input supply1 id_7,
    input wand id_8
);
  always_comb begin : LABEL_0
    if ({1}) wait (!id_8 == id_2) id_3 = id_0;
    id_3 = id_0 == 1;
  end
  supply1 id_10 = id_5;
  wire id_11;
  always begin : LABEL_0
    id_1 = 1;
  end
  assign id_10 = 1;
endmodule
module module_1 (
    output logic id_0,
    output uwire void id_1,
    input wire id_2,
    input uwire id_3,
    input uwire id_4,
    output uwire id_5
);
  pullup (1);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_1,
      id_1,
      id_3,
      id_5,
      id_4,
      id_2
  );
  assign modCall_1.type_0 = 0;
  assign id_1 = id_3;
  always $display(1);
  always id_0 <= 1;
  wire id_7;
  assign id_0 = 1;
  wire id_8;
  wire id_9;
  assign id_5 = 1;
endmodule
