// Seed: 1135930355
module module_0 (
    output supply1 id_0,
    input wor id_1,
    output tri0 id_2
);
  tri0 id_4;
  logic [7:0] id_5;
  assign id_4 = 1;
  always @(posedge !1'b0);
  genvar id_6;
  wire id_7;
  assign id_5[1+:1'd0] = 1;
endmodule
module module_1 (
    input  wand id_0,
    inout  tri0 id_1,
    output wire id_2,
    input  wand id_3,
    output tri  id_4,
    output wand id_5
);
  always @(posedge 1);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
