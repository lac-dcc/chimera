// Seed: 1574647356
module module_0 (
    inout tri id_0,
    output supply1 id_1,
    input tri0 id_2,
    output tri id_3,
    input tri1 id_4,
    output wire id_5,
    output wire id_6
);
  wire  id_8;
  tri   id_9 = 1;
  uwire id_10 = 1;
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1,
    output logic id_2,
    output supply0 id_3,
    input tri1 id_4,
    inout wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input logic id_8,
    input tri1 id_9
);
  always_ff begin : LABEL_0
    id_2 <= id_8;
  end
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_5,
      id_5,
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
