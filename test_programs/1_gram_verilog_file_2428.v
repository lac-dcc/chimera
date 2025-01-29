// Seed: 2212418376
program module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  assign module_1.id_2 = 0;
  id_3(
      (1), (id_2), id_2
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always
    assert (id_2 - -1'b0 ? -1 : id_2)
      @(1'b0 | id_3 or -1 - id_2 || id_3) begin : LABEL_0
        id_1 = 1;
      end
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
