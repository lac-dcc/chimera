// Seed: 1008711288
module module_0 (
    output tri  id_0,
    input  wor  id_1,
    input  wire id_2,
    output tri  id_3,
    input  tri1 id_4
);
  tri1 id_6, id_7, id_8 = id_1, id_9;
  wire id_10;
  if (id_4) begin : LABEL_0
    assign id_0 = id_9;
  end else assign id_0 = -1;
  wire id_11;
  assign module_1.id_1 = 0;
  wire id_12;
endmodule
module module_1 (
    output tri0 id_0,
    input  wor  id_1,
    input  tri  id_2,
    output tri  id_3,
    input  tri1 id_4,
    input  tri1 id_5
);
  wire id_7;
  assign id_0 = id_4;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_0,
      id_5
  );
endmodule
