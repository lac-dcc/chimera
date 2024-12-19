// Seed: 1668892375
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  or primCall (id_5, id_3, id_4, id_1, id_2);
  assign id_5 = 1;
  if (id_2) begin : LABEL_0
    assign id_5 = id_1;
  end
endmodule
module module_2;
  tri id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  reg id_2;
  initial begin : LABEL_0
    id_2 <= 1;
  end
  assign id_2 = (1'b0 + id_1);
endmodule
