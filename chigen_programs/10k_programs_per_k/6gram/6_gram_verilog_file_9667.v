// Seed: 3182436957
module module_0 (
    input  wand  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    output tri0  id_3
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output logic id_3
);
  logic [7:0] id_5;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.type_5 = 0;
  assign id_5[1] = 1;
  reg id_10;
  assign id_10 = id_6;
  initial begin : LABEL_0
    id_3 <= id_10;
    assert (id_1);
  end
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14, id_15;
  wire id_16;
endmodule
