// Seed: 1820153204
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output tri0 id_2
);
  integer id_4;
  assign id_4[1] = id_1;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1
);
  always_ff begin : LABEL_0
    id_1 <= 1'b0;
  end
  reg id_3;
  reg id_4;
  supply1 id_5 = id_0;
  xnor primCall (id_1, id_8, id_6, id_4, id_10, id_7, id_0, id_9, id_3);
  wire id_6;
  genvar id_7;
  wire id_8 = id_6, id_9, id_10;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_11;
  always id_4 <= id_3;
endmodule
