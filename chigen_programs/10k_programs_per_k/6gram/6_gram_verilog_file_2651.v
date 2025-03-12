// Seed: 2453467954
module module_0 (
    input  tri   id_0,
    input  wor   id_1
    , id_7,
    output tri1  id_2,
    input  tri1  id_3,
    inout  uwire id_4,
    output uwire id_5
);
  wire id_8;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input wor id_1,
    output supply0 id_2,
    inout wand id_3,
    input uwire id_4,
    output logic id_5,
    output tri0 id_6,
    input tri1 id_7,
    output wire id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_3,
      id_1,
      id_3,
      id_0
  );
  assign id_8 = id_1;
  initial begin : LABEL_0
    id_5 <= id_4 ? id_1 : -1'd0;
  end
endmodule
