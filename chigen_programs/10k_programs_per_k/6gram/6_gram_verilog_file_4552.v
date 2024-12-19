// Seed: 633766523
module module_0;
  wire id_2;
  assign module_2.type_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 ();
  wire id_5;
  id_6(
      .id_0(1'b0), .id_1(id_3), .id_2(id_5), .id_3(id_1), .id_4(1), .id_5(1)
  );
  assign id_1 = id_3;
endmodule
module module_2 (
    input  tri   id_0,
    input  wire  id_1,
    output logic id_2
);
  always @* begin : LABEL_0
    id_2 <= ~id_0;
    wait (id_1);
  end
  reg id_4;
  always id_4 = #1 1;
  module_0 modCall_1 ();
endmodule
