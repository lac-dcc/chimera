// Seed: 2555113918
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign module_1.id_3 = 0;
  always id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3
  );
  assign id_4 = 1'h0;
  always begin : LABEL_0
    id_3 = id_2;
    return 1;
    id_3 = id_2 < 1'b0;
    $display;
    if (id_2) begin : LABEL_0
      id_4 <= id_7;
    end
  end
endmodule
