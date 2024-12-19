// Seed: 1566476228
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    module_0,
    id_9,
    id_10
);
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_12;
  wire id_13;
  assign id_7 = 1'b0 ? id_12 : id_12;
  assign module_1.id_6 = 0;
  wire id_14;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  for (id_6 = 1; id_3; id_3 += id_6) begin : LABEL_0
    always @(negedge 1'd0) begin : LABEL_0
      id_5 <= (1);
    end
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_6,
      id_1,
      id_3,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6
  );
endmodule
