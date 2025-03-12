// Seed: 2710739149
module module_0 (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  input wire id_1;
  assign module_1.id_3 = 0;
  always_ff @(posedge -1 or posedge (id_1)) begin : LABEL_0
    id_2[(1'h0)] = {id_1, id_2, "", 1};
    $signed(39);
    ;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd32
) (
    id_1,
    id_2,
    _id_3
);
  input wire _id_3;
  inout logic [7:0] id_2;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  inout supply1 id_1;
  assign id_2[-1 : id_3] = -1'b0;
  initial begin : LABEL_0
    $clog2(18);
    ;
  end
  wire id_4;
  assign id_1 = 1;
endmodule
