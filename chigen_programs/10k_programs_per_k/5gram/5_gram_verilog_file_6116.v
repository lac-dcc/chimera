// Seed: 3527973529
module module_0 (
    output supply1 id_0,
    input  supply1 id_1
);
  wire id_3;
  ;
endmodule
module module_1 (
    output tri1 id_0,
    output logic id_1,
    input supply1 id_2,
    output supply0 id_3
);
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
  initial begin : LABEL_0
    begin : LABEL_1
      while (id_2) begin : LABEL_2
        id_1 <= -1 & -1;
      end
      $unsigned(7);
      ;
    end
  end
  assign id_1#(
      .id_2(1),
      .id_2(-1'b0),
      .id_2(-1'b0),
      .id_2(-1),
      .id_2(-1),
      .id_2(-1),
      .id_2(1),
      .id_2(-1)
  ) = -1 == id_2;
endmodule
