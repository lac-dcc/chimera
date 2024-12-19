// Seed: 2574562566
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input wand id_3,
    input wor id_4,
    input supply0 module_0
);
  reg  id_7;
  wand id_8 = 1;
  id_9(
      id_1, 1
  );
  tri1 id_10;
  reg  id_11;
  wire id_12;
  wire id_13;
  always_ff @(negedge 1) #1;
  logic [7:0] id_14;
  always_latch @(posedge 1 - id_1 or negedge id_0) id_10 = id_5;
  wire id_15;
  assign module_1.type_1 = 0;
  wire id_16;
  assign id_14[1] = id_5;
  always @(posedge id_14 or negedge $display) begin : LABEL_0
    id_11 <= id_7;
  end
endmodule
module module_1 (
    input  uwire id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  tri0  id_3,
    output tri   id_4,
    output tri   id_5
);
  final $display(id_1, id_0);
  wire id_7;
  wire id_8;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0
  );
endmodule
