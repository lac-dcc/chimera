// Seed: 2099942951
module module_0 (
    input  uwire id_0,
    output logic id_1,
    input  wire  id_2,
    input  wand  id_3,
    output tri   id_4
);
  uwire id_6;
  final
    if (1) id_6 = id_3;
    else #1 id_1 <= 1'd0;
  always id_1 = 1;
  wire id_7;
endmodule
module module_1 (
    input uwire id_0,
    output logic id_1,
    output tri0 id_2,
    output tri id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wand id_6
);
  reg id_8;
  always begin : LABEL_0
    id_1 <= id_8;
  end
  module_0 modCall_1 (
      id_6,
      id_1,
      id_5,
      id_0,
      id_3
  );
  assign modCall_1.type_3 = 0;
endmodule
