// Seed: 4181099966
module module_0 ();
  tri id_1 = 1;
  module_2 modCall_1 ();
endmodule
module module_1;
  parameter id_1 = -1'h0 !=? 1;
  module_0 modCall_1 ();
  assign modCall_1.type_2 = 0;
endmodule
module module_2 ();
  id_1();
  module_3 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_4 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_7 :
  assert property (@(posedge -1) id_4) begin : LABEL_0
    begin : LABEL_0
      id_3 <= ~id_2;
      $display(id_3, id_4, -1);
    end
  end
  module_3 modCall_1 (
      id_1,
      id_1,
      id_6
  );
  tri id_8;
  assign {id_3, id_2} = id_2;
  id_9(
      .id_0(id_7)
  );
  assign id_8 = -1'b0;
  bit id_10;
  always id_1 = -1;
  string id_11, id_12;
  wire id_13;
  assign id_12 = "";
  assign id_7  = -1;
  parameter int id_14 = -1;
  assign id_5 = id_1;
  logic [7:0] id_15, id_16, id_17;
  assign id_16[-1] = -1;
  id_18(
      {-1 ? !id_1 : id_10}, -1, id_3
  );
endmodule
