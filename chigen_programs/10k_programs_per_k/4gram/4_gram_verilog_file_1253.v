// Seed: 3918163127
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri0 id_3,
    output supply0 id_4,
    input wire id_5,
    output tri1 id_6,
    output supply1 id_7,
    output tri1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input supply0 id_11,
    output supply0 id_12
);
  wire id_14;
  wire module_0;
  wire id_15;
  assign module_1.type_9 = 0;
  id_16(
      .id_0(1), .id_1(!id_2)
  );
  wire id_17;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    output supply0 id_2,
    output wire id_3,
    input tri id_4
);
  tri1 id_6;
  wire id_7;
  initial begin : LABEL_0
    deassign id_7;
  end
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_2,
      id_6,
      id_0,
      id_6,
      id_6,
      id_2,
      id_6,
      id_0,
      id_4,
      id_2
  );
  assign id_6 = id_4;
  wire id_8;
endmodule
