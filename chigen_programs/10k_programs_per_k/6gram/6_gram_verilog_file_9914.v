// Seed: 3508959390
module module_0 (
    input  wand  id_0,
    input  wand  id_1,
    input  uwire id_2,
    output wire  id_3
);
  wire id_5;
  wire id_6;
  wire id_7;
  assign id_3 = id_2;
  assign module_1.id_1 = 0;
  wire id_8;
  always repeat (id_5) id_3 = 1'b0;
endmodule
module module_1 (
    input  uwire id_0,
    input  logic id_1,
    input  uwire id_2,
    input  wire  id_3,
    output uwire id_4
);
  always @(posedge 1'b0) {1, 1} <= id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_4
  );
endmodule
