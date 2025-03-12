// Seed: 1437376572
module module_0 (
    output tri0 id_0,
    input uwire id_1,
    input wire id_2,
    input wand id_3,
    output uwire id_4,
    output supply1 id_5
);
  assign id_0 = id_1;
endmodule
module module_1 (
    output tri1  id_0,
    output logic id_1,
    input  uwire id_2,
    input  tri0  id_3,
    output logic id_4,
    output logic id_5
);
  logic id_7;
  initial begin : LABEL_0
    id_7 = id_2;
    if (~1) id_4 = id_3;
    id_5 = #id_8 id_8;
    id_1 <= id_8;
    disable id_9;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
