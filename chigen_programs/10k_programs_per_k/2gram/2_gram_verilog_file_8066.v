// Seed: 1891935243
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_10;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_1,
      id_2,
      id_2,
      id_2,
      id_8,
      id_8
  );
  initial begin : LABEL_0
    id_4 <= 1;
    @(posedge 1 & id_10 & 1) begin : LABEL_0
      `define pp_12 0
    end
  end
endmodule
