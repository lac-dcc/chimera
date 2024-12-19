// Seed: 716737083
module module_0;
  id_1(
      .id_0(id_2), .id_1(id_3), .id_2(1), .id_3(1)
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_4;
  initial begin : LABEL_0
    begin : LABEL_0
      @(posedge 1) id_4 <= #1 id_4 - 1;
      id_4 <= #(id_4) id_3 + 1;
    end
  end
  assign id_2 = id_4;
  uwire id_5, id_6, id_7, id_8;
  always id_1 = id_5;
  initial id_6 = 1;
  module_0 modCall_1 ();
endmodule
