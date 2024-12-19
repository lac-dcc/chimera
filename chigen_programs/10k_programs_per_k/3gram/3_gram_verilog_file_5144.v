// Seed: 1534022440
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8;
  wire id_9;
  assign id_6 = 1'b0;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    output logic id_0,
    output uwire id_1
);
  always @(posedge 1'b0 - id_3)
    if (id_3) begin : LABEL_0
      id_0 <= 1;
    end
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
