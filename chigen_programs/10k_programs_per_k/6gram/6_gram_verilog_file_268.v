// Seed: 133860345
module module_0 (
    input uwire id_0,
    input tri   id_1,
    input wor   id_2,
    input tri0  id_3,
    input wor   id_4
);
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    output tri0  id_2,
    input  wire  id_3,
    output uwire id_4
);
  logic [1 : -1] id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0
  );
  assign id_6 = id_1;
  logic id_7;
  ;
endmodule
module module_2 (
    input  uwire   id_0
    , id_3,
    output supply0 id_1
);
  localparam id_4 = 1;
  parameter id_5 = {id_4, id_4[-1'b0], id_4, -1, id_4[1], 1, id_4, id_4};
  wire id_6;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
  initial begin : LABEL_0
    @(negedge -1);
    id_3 <= id_4;
  end
endmodule
