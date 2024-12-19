// Seed: 1538502812
module module_0 (
    input  wire id_0,
    output wire id_1
);
  assign id_1 = (1'h0);
  module_2 modCall_1 ();
  assign modCall_1.id_4 = 0;
endmodule
module module_1 (
    input  wand id_0,
    input  tri  id_1,
    output tri  id_2,
    input  wand id_3
);
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2;
  wire id_1;
  module_3 modCall_1 ();
  always @(posedge 1) begin : LABEL_0
    id_2 = #id_4 1;
  end
endmodule
module module_3;
  wire id_2;
  supply0 id_3 = 1;
  assign id_3 = 1;
  assign module_2.id_4 = 0;
  supply1 id_4 = id_1;
  supply0 id_5 = 1;
  wire id_6;
  id_7(
      .id_0(1), .id_1(1), .id_2(1'h0), .sum((id_6)), .id_3(id_1), .id_4((id_3)), .id_5(1)
  );
endmodule
