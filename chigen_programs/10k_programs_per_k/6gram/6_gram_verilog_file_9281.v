// Seed: 2938624556
module module_0 (
    output supply1 id_0,
    input tri id_1
);
  specify
    specparam id_3 = -1;
  endspecify
  not primCall (id_0, id_3);
  module_2 modCall_1 (
      id_1,
      id_0,
      id_0
  );
endmodule
module module_1 (
    input  tri0 id_0,
    input  wire id_1,
    output wire id_2
);
  logic id_4 = id_0;
  module_0 modCall_1 (
      id_2,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input  tri1 id_0,
    output tri0 id_1,
    output tri0 id_2
);
  always @* begin : LABEL_0
    if (-1 && 1 == 1) begin : LABEL_1
      force id_1 = -1;
    end
  end
  assign module_0.id_3 = 0;
endmodule
