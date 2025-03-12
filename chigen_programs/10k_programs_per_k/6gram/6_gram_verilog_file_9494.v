// Seed: 4022810973
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input supply1 id_2,
    output wire id_3
);
  parameter id_5 = 1;
  supply0 id_6;
  wire id_7;
  ;
  always @(negedge id_7) begin : LABEL_0
    release id_3;
  end
  assign id_6 = -1'b0;
  logic [1 : -1] id_8;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd99
) (
    input  tri0 _id_0,
    input  tri  id_1,
    input  tri  id_2,
    input  wor  id_3,
    input  tri0 id_4,
    output tri0 id_5
);
  wire [1 : id_0] id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_5
  );
  assign modCall_1.id_6 = 0;
  wire id_8;
  ;
  wire id_9;
  ;
  assign id_5 = ~id_7;
endmodule
