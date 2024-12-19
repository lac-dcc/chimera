// Seed: 1093914897
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input wor id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply0 id_5,
    output uwire id_6
);
  wire id_8;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri1  id_1,
    output tri1  id_2,
    input  logic id_3,
    input  tri   id_4,
    output tri   id_5,
    input  wire  id_6,
    output wire  id_7,
    output logic id_8
);
  always begin : LABEL_0
    if (id_6) #(id_4);
    id_8 <= id_3;
  end
  genvar id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_6,
      id_4,
      id_0,
      id_1
  );
  assign modCall_1.type_1 = 0;
endmodule
