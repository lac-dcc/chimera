// Seed: 3997993967
macromodule module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  assign id_2 = id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd53
) (
    _id_1
);
  output wire _id_1;
  logic [id_1 : 1 'b0] id_2;
  assign id_1 = id_2;
  wire id_3;
  reg  id_4;
  ;
  initial id_4 = 1;
  parameter [-1 : -1 'b0] id_5 = -1'b0;
  tri  id_6 = 1'b0;
  wire id_7 = id_5;
  always @(posedge id_5) begin : LABEL_0
    $signed(id_1);
    ;
  end
  or primCall (id_1, id_4, id_7);
  module_0 modCall_1 (
      id_5,
      id_6
  );
  always @(posedge !id_3) begin : LABEL_1
    id_2 <= {1{-1 & ""}};
  end
  always @(posedge 1 or posedge id_3) id_2 <= -1;
endmodule
