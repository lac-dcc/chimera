// Seed: 3288658372
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri id_3,
    input supply0 id_4,
    input wor id_5,
    output tri0 id_6,
    output wire id_7,
    output wire id_8,
    input tri1 id_9,
    input uwire id_10,
    input tri0 id_11,
    input tri id_12,
    input tri0 id_13,
    output uwire id_14,
    output supply0 id_15
);
  always @(posedge -1) begin : LABEL_0
    $unsigned(10);
    ;
  end
  logic id_17 = -1;
  logic [1 : -1] \id_18 = id_12 == -1;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output tri0  id_2
);
  assign id_2 = 1;
  logic id_4;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_6 = 0;
  assign id_2 = id_1;
endmodule
