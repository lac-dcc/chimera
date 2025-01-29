// Seed: 3904553817
module module_0;
  integer id_1 (
      .id_0(id_2),
      .id_1(1),
      .id_2(~id_2),
      .id_3(-1),
      .id_4(id_2 | -1)
  );
  localparam id_3 = id_3;
endmodule
module module_1 ();
  assign {1'b0, -1} = id_1;
  assign id_2 = 1;
  module_0 modCall_1 ();
  integer id_3, id_4;
endmodule
module module_2;
  initial begin : LABEL_0
    id_1 <= id_1;
    begin : LABEL_0
      id_2 <= id_2;
    end
    begin : LABEL_0$display
      ;
    end
  end
  module_0 modCall_1 ();
endmodule
