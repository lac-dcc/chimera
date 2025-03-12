// Seed: 3771706042
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout supply0 id_2;
  output wire id_1;
  integer [(  -1 'd0 &  ~  -1  ) : 1] id_5;
  always @(posedge -1'h0) $signed(18);
  ;
  assign module_1.id_5 = 0;
  assign id_2 = (-1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout reg id_5;
  input wire id_4;
  output reg id_3;
  input wire id_2;
  output wire id_1;
  logic id_6;
  wire  id_7;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7,
      id_7
  );
  always @(posedge id_6 or posedge 1) begin : LABEL_0
    if (-1) begin : LABEL_1
      id_6 <= id_7;
    end else id_3 <= id_2;
    id_6 = "";
    id_5 <= (id_2);
    #1;
  end
  parameter id_8 = 1;
endmodule
