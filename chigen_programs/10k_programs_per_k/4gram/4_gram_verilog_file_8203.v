// Seed: 43213223
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  initial begin : LABEL_0
    if (id_2) begin : LABEL_0
      id_2 = id_1;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_1
  );
endmodule
