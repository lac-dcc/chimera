// Seed: 2297361724
module module_0 (
    output wire id_0,
    output tri1 id_1
);
  tri0 id_4;
  assign id_1 = 1 || id_4;
  wire id_5;
  always @(negedge 1) begin : LABEL_0$display
    ;
  end
  wand id_6;
  integer id_7;
  assign id_6 = id_3;
  wire id_8;
  integer id_9 (
      .id_0(~id_3),
      .id_1(id_3),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(id_1)
  );
  wire id_10;
  assign id_1 = 1;
  wire id_11 = id_10;
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri id_2,
    input wand id_3,
    output wire id_4
);
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
