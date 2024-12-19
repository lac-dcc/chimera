// Seed: 3574006341
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = 1 ? id_7 : 1 - id_6;
  wor  id_8;
  wire id_9;
  wire id_10;
  wire id_11 = id_1;
  assign id_7 = id_2++;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(negedge 1 or id_4) begin : LABEL_0
    begin : LABEL_0
      id_3 <= 1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
