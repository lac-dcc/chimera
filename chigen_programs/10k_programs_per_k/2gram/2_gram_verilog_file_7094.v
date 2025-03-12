// Seed: 299381411
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout tri0 id_1;
  assign id_1 = 1;
  generate
    logic [-1 'b0 : -1] id_4;
  endgenerate
  wire id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd13
) (
    id_1,
    _id_2
);
  input wire _id_2;
  inout reg id_1;
  logic [1 : -1 'b0] id_3;
  ;
  tri0 id_4;
  assign id_4 = 1;
  always begin : LABEL_0
    id_1 = 1;
    id_1 <= id_4;
    id_3 <= id_3 ? 1 : 1'd0 ? -1 : id_3 ? -1'h0 : 1;
  end
  id_5 :
  assert property (@(id_2 or posedge id_3 !== id_4) 1)
  else;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  assign id_4 = id_4;
  logic [-1 : id_2] id_6;
  ;
endmodule
