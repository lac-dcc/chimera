// Seed: 4045125098
module module_0;
  wire id_2;
  wire id_3;
endmodule
module module_1;
  wire id_1;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0();
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_5(
      .id_0(id_2), .id_1(id_1), .id_2(id_1), .id_3(""), .id_4(id_2), .id_5(1), .id_6(1), .id_7(id_1)
  ); module_0();
  if ("") begin
    always begin
      id_2 <= "";
    end
  end else begin : id_6
    wire id_7;
  end
  wire id_8;
  id_9(
      .id_0(1),
      .id_1(id_8),
      .id_2(1),
      .id_3(id_4),
      .id_4(1),
      .id_5(1'b0),
      .id_6(1),
      .id_7(1),
      .id_8(1),
      .id_9(1'b0),
      .id_10(1),
      .id_11(1'd0),
      .id_12(id_2)
  );
endmodule
