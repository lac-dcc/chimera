// Seed: 4068389819
module module_0 ();
  uwire id_1 = id_1, id_2 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_1 = 32'd47
);
  wire [-1 : 1] _id_1;
  module_0 modCall_1 ();
  logic [7:0][-1 : id_1] id_2;
  assign id_2['b0 : 1] = id_2[1'b0];
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  inout reg id_3;
  input logic [7:0] id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  input wire id_1;
  initial begin : LABEL_0
    id_3 <= id_2[-1];
    begin : LABEL_1
      $clog2(63);
      ;
      id_3 <= (id_1);
    end
  end
  assign id_3 = -1;
endmodule
