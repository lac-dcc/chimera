// Seed: 146537819
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1 ? id_1 : 1'd0;
  assign id_2 = 1;
  reg id_4;
  assign module_1.id_1 = 0;
  id_5(
      .id_0(1 > id_3 ? 1'b0 : id_4)
  );
  final begin : LABEL_0
    id_4 = #1 id_1;
  end
endmodule
module module_1;
  always begin : LABEL_0
    @(negedge 1) begin : LABEL_0
      id_1 <= {1, id_1, id_1};
    end
    id_2 = 1;
    id_2 = id_2;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2
  );
endmodule
