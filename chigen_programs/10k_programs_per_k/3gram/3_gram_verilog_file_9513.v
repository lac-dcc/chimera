// Seed: 2804479597
module module_0 (
    output tri id_0,
    output supply1 id_1,
    output supply0 id_2,
    input tri1 id_3,
    input tri id_4
);
  bit  id_6 = -1;
  wire id_7;
  wire id_8 = id_4;
  genvar id_9;
  always id_6 = #1 id_4;
  always @(1 or posedge 1);
  wire id_10 = id_6;
  reg  id_11 = 1'b0;
  always_latch @(!-1) begin : LABEL_0
    if (1) id_11 <= id_10;
  end
endmodule
module module_1 (
    input wand id_0,
    output wire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output supply1 id_4,
    input wand id_5
);
  assign id_4 = id_5 / id_5;
  assign id_4 = -1;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.id_3 = 0;
  wire id_7;
  wire id_8;
  assign id_1 = (-1'b0) - -1 / id_8;
  assign id_7 = id_5;
endmodule
