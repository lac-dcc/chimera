// Seed: 240839813
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    output wire id_2
);
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    input  tri0  id_0,
    output tri0  id_1,
    input  tri1  id_2,
    input  uwire id_3,
    output logic id_4,
    output logic id_5,
    input  wire  id_6,
    output uwire id_7,
    inout  logic id_8,
    input  tri1  id_9,
    input  wand  id_10
);
  always
    if (id_10.id_3) id_4 <= 1 & -1;
    else begin : LABEL_0
      id_8 = 1;
      id_8 <= 1;
      if ("");
      else;
    end
  parameter id_12 = id_12;
  module_0 modCall_1 (
      id_10,
      id_1,
      id_7
  );
  assign modCall_1.id_0 = 0;
  initial begin : LABEL_0
    id_5 <= #1 -1;
  end
endmodule
