// Seed: 93444798
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign module_1.id_0 = 0;
  wire id_3;
endmodule
module module_1 #(
    parameter id_0 = 32'd67
) (
    input  wor   _id_0,
    output uwire id_1
);
  uwire id_3, id_4;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_4,
      id_3
  );
  parameter id_5 = 1;
  assign id_1 = 1;
  parameter id_6 = id_5;
  wire id_7;
  assign id_3 = id_6[{id_0{1'b0}}];
  assign id_3 = 1;
  id_8 :
  assert property (@(negedge id_5) 1)
  else
    @(posedge -1 or negedge id_7) begin : LABEL_0
      {-1'h0, id_6, id_6} <= 1'd0;
    end
  assign id_7 = ~id_8;
endmodule
