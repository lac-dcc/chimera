// Seed: 2526368465
module module_0 (
    id_1
);
  output wire id_1;
  tri1 id_2, id_3, id_4;
  wire id_5;
  id_6(
      {id_3}, 1
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  always_latch id_1 = id_2;
  reg id_3, id_4;
  assign id_1 = id_2;
  tri1 id_5;
  assign id_2 = id_4;
  initial begin : LABEL_0
    begin : LABEL_0
      begin : LABEL_0
        id_1 <= id_3;
        id_1 <= id_5 - id_3;
      end
      begin : LABEL_0
        id_3 <= #1 id_3;
        @(1) id_1 <= 1;
      end
    end
  end
  assign id_4 = 1'h0;
  assign id_3 = 1'b0;
  wire id_6;
  module_0 modCall_1 (id_5);
endmodule
