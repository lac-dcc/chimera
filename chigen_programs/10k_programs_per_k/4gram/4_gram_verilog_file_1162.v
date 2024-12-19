// Seed: 951825005
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  wire  id_0,
    input  tri   id_1,
    input  tri   id_2,
    output uwire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_5;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
  initial begin : LABEL_0
    if (1) begin : LABEL_0
      fork
        $display;
      join
    end else id_4 <= id_5;
  end
endmodule
