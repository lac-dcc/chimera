// Seed: 790593398
module module_0;
  wand id_1;
  supply1 id_2;
  id_3(
      .id_0(id_2), .id_1(1), .id_2(id_2), .id_3(1 ? (1'b0) : id_4), .id_4(id_2)
  );
  assign id_1 = "" - id_2;
  wire id_5;
endmodule
module module_1 ();
  reg id_1 = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.type_1 = 0;
  always begin : LABEL_0
    id_1 <= #1 1;
  end
endmodule
module module_2;
  wire id_2;
  module_0 modCall_1 ();
  assign modCall_1.type_1 = 0;
  id_3 :
  assert property (@(posedge 1) id_3)
  else;
  assign id_3 = 1;
  wire id_4;
endmodule
