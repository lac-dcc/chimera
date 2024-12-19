// Seed: 1531407637
module module_0 ();
  generate
    if (id_1) begin : LABEL_0
      id_4(
          .id_0(1), .id_1(1)
      );
    end else begin : LABEL_0
      id_5(
          .id_0(1 == id_1), .id_1(1), .id_2(1)
      );
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_7(
      .id_0(id_1), .id_1(id_3[$display()]), .id_2(id_2), .id_3(id_5)
  );
  module_0 modCall_1 ();
  id_8(
      .id_0(id_1), .id_1(1), .id_2(id_2 - 1)
  );
  assign id_2 = 1;
  wire id_9;
endmodule
