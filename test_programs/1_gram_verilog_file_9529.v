// Seed: 3303918414
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  function id_3;
    output id_4;
    id_3 = 1;
  endfunction
  parameter id_5 = 1 * -1;
  for (id_6 = id_3 ^ id_5; id_5; id_4 = -1'b0) begin : LABEL_0
    assign id_4 = -1;
  end
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  parameter id_4 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
