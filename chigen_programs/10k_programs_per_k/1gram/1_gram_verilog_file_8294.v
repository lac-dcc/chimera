// Seed: 90903274
module module_0;
  wire id_2;
  wire id_3 = id_1;
  assign module_1.type_3 = 0;
  genvar id_4;
  wire id_5, id_6, id_7;
  id_8(
      .id_0(1'b0), .id_1(1)
  );
  module_2 modCall_1 ();
endmodule
module module_1 (
    input uwire id_0,
    input supply1 id_1,
    input tri id_2,
    input wand id_3
);
  always $display(1, 1, id_3 - 1, id_3);
  module_0 modCall_1 ();
endmodule
module module_2 ();
  assign id_1 = 1;
  reg id_2;
  logic [7:0] id_3;
  always_ff begin : LABEL_0
    id_3[1] <= id_2;
  end
endmodule
