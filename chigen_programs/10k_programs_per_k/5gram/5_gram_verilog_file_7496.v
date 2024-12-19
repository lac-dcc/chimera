// Seed: 807414483
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3, id_4;
  initial begin : LABEL_0
    repeat (1'b0) begin : LABEL_0
      fork
        id_5;
        id_6;
      join
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  wire id_4;
  tri  id_5 = id_3;
  assign id_3 = 1'b0;
  wire id_6;
endmodule
