// Seed: 47647686
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_11 = 1;
  always @(posedge 1 or posedge -1) begin : LABEL_0
    $unsigned(35);
    ;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2
  );
  logic \id_4 ;
  ;
  assign \id_4 = id_3;
  logic id_5;
  assign id_1[-1'b0] = 1;
  wire id_6;
  ;
  assign id_6 = id_5;
  assign id_1 = \id_4 ;
endmodule
