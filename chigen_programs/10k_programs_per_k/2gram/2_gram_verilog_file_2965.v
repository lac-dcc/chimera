// Seed: 3829073997
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    input wand id_4,
    output tri1 id_5
);
  assign id_5 = 1;
endmodule
module module_1 (
    output logic id_0,
    input  wire  id_1,
    output wire  id_2,
    input  tri1  id_3
);
  wire id_5;
  ;
  always_latch begin : LABEL_0
    id_0 <= id_3;
  end
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_2 = 0;
  logic [1 : 1] id_7;
  wire id_8;
  parameter id_9 = 1'b0;
endmodule
