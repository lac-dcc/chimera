// Seed: 1906481488
module module_0 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  module_0 modCall_1 ();
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
endmodule
module module_2 (
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
  input wire id_10;
  input wire id_9;
  input wire id_8;
  module_0 modCall_1 ();
  output logic [7:0] id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always_comb @(posedge id_10 or 1) begin : LABEL_0
    id_7[-1'b0|1][1] <= -1;
  end
endmodule
