// Seed: 2396601381
module module_0 (
    output uwire id_0,
    output uwire id_1,
    output supply0 id_2,
    input tri id_3
);
  wire [1 'b0 : 1] id_5;
  assign id_0 = -1'b0;
  always @(posedge 1)
    if (1) begin : LABEL_0
      $clog2(3);
      ;
    end
  wire id_6;
  ;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply0 id_3,
    output wor id_4,
    output uwire id_5
);
  specify
    (posedge id_7 => (id_8 +: -1)) = (id_1, -1);
  endspecify
  or primCall (id_0, id_1, id_2, id_3, id_8, id_7);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
