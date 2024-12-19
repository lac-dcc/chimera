// Seed: 2162448859
module module_0 (
    output uwire id_0,
    output tri1  id_1,
    output wire  id_2,
    output wire  id_3,
    input  wand  id_4,
    output uwire id_5
);
  assign id_2 = 1;
  always_latch @(posedge id_4 == id_4 or posedge 1'b0) begin : LABEL_0
    #1;
  end
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    output tri0  id_1,
    input  tri1  id_2,
    input  uwire id_3
);
  wand id_5;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_1
  );
  assign id_1 = id_3;
  assign id_0 = id_5 ? 1'b0 == 1 : id_3;
  wire id_6;
endmodule
