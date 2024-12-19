// Seed: 1680264048
module module_0;
  reg id_1, id_2, id_3;
  reg id_4, id_5;
  always begin : LABEL_0
    wait (id_4) @(posedge id_3 or negedge id_5 >>> id_2 - 1) id_5 = 1;
    if (1'b0 ? id_4 : 1)
      if (!id_3)
        #1 begin : LABEL_0
          id_1 = 1;
        end
      else if (id_4) if (1) if (id_3) id_3 = id_5;
    id_1 = 1'b0;
    id_2.id_4 = id_5;
    id_4 <= id_3 | id_4 ? id_4 : id_2;
  end
  assign id_3 = 1;
  wire id_6, id_7;
  assign id_5 = 1;
  uwire id_8 = 1'b0, id_9;
endmodule
macromodule module_1;
  assign id_1 = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_9 = 0;
  wire id_2;
  tran (.id_0(1), .id_1(1), .id_2(1), .id_3(id_1), .id_4(1 ? id_1 : 1), .id_5(1));
endmodule
