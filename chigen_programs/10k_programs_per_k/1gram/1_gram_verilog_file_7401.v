// Seed: 1981543368
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    input  uwire id_2,
    input  wire  id_3,
    output logic id_4,
    input  logic id_5,
    input  logic id_6,
    input  uwire id_7,
    input  logic id_8
);
  initial begin : LABEL_0
    begin : LABEL_0
      if (id_1) begin : LABEL_0
        if (1) id_4 = id_8;
        else id_4 <= id_6;
      end else id_4 = id_1;
      if (1)
        @(posedge 1 or posedge id_0#(.id_3(1), .id_2(1), .id_6(~id_6), .id_6(1))) id_4 = (id_0);
      else id_4 <= 1'b0;
    end
  end
  reg  id_10;
  wire id_11;
  for (id_12 = 1; id_1; id_12 = id_5) always id_10 <= 1'd0 + 1;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_11,
      id_11,
      id_11
  );
  id_13 :
  assert property (@(1) 1)
    if (id_1) id_12 <= 1'b0;
    else id_12 = 1;
endmodule
