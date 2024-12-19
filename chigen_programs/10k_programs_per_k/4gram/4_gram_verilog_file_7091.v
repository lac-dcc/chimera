// Seed: 3598425974
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  final begin : LABEL_0
    fork
      #1;
      id_5(1);
    join
  end
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4
  );
  wire id_5;
  assign id_1 = id_2;
endmodule
module module_2 (
    output wand id_0,
    output tri0 id_1,
    output tri  id_2,
    input  tri0 id_3,
    input  tri1 id_4,
    input  wand id_5,
    input  tri0 id_6,
    input  wire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9
  );
  wire id_10;
  always @* deassign id_9;
endmodule
