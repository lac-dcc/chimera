// Seed: 2750728292
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  if (1'b0) begin : LABEL_0
    id_7(
        .id_0(id_2), .id_1(1)
    );
  end
  generate
    assign id_3 = id_2;
  endgenerate
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3[1];
  id_4(
      .id_0(1'b0), .id_1(id_2 <-> 1), .id_2(id_1), .id_3(), .id_4(1'b0 == 1), .id_5(!1)
  );
  supply1 id_5, id_6;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_2,
      id_2,
      id_2
  );
endmodule
