// Seed: 1746137240
module module_0 (
    input  uwire   id_0,
    output uwire   id_1,
    input  supply0 id_2,
    output uwire   id_3
);
  wire id_5 = 1;
  assign module_2.type_6 = 0;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1,
    output tri   id_2
);
  always @(1'h0 or negedge id_1) begin : LABEL_0
    id_2 = 1;
  end
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output uwire id_3
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3
  );
endmodule
