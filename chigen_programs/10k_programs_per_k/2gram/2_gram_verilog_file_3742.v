// Seed: 1959886436
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_2.id_3 = 0;
  wire id_6;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd12
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_2,
      id_4
  );
  inout wire id_3;
  inout wire id_2;
  inout wire _id_1;
  logic [id_1 : -1] id_5;
endmodule
module module_2 (
    output wor   id_0,
    output wire  id_1,
    input  uwire id_2,
    output wor   id_3,
    input  wor   id_4,
    output uwire id_5,
    input  tri0  id_6,
    output wor   id_7,
    output tri   id_8,
    output wire  id_9
);
  wire  id_11;
  wire  id_12;
  logic id_13;
  ;
  reg id_14;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_13,
      id_13,
      id_11
  );
  wire id_15;
  always @(posedge id_4 or posedge 1) begin : LABEL_0
    id_14 <= id_12;
  end
endmodule
