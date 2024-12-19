// Seed: 3143728601
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2
);
  assign id_4 = "";
  wand id_5;
  id_6(
      .id_0(1 != id_5), .id_1(id_4)
  );
endmodule
module module_1 (
    output wand id_0,
    input  tri1 id_1,
    output wand id_2,
    input  tri0 id_3,
    output wand id_4,
    input  tri  id_5,
    input  wire id_6
);
  always_latch @(posedge id_6 or posedge id_3) begin : LABEL_0$display
    ;
  end
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6
  );
  assign modCall_1.id_4 = "";
  wire id_8;
endmodule
