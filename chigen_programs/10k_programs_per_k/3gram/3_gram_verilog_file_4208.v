// Seed: 1495781963
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2
);
  reg id_4;
  initial begin : LABEL_0
    id_4 <= id_0;
    id_2 <= id_1;
  end
  assign id_4 = 1'b0;
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  id_5(
      .id_0(1), .id_1(id_2), .id_2(1)
  );
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_1
  );
endmodule
