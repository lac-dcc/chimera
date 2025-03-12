// Seed: 4164299092
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  assign module_1.id_7 = 0;
  inout wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout logic [7:0] id_5;
  inout wire id_4;
  output reg id_3;
  output reg id_2;
  output wire id_1;
  parameter id_6 = -1'b0 - -1;
  bit id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6
  );
  always @(posedge id_5[({-1-1'h0,
    1
  })])
  begin : LABEL_0
    id_7 = id_6;
  end
  always @(*)
    if (1) begin : LABEL_1
      id_2 = -1;
    end else begin : LABEL_2
      id_3 <= 1;
      if (~id_6) id_2 <= id_5;
      else id_2 <= -1;
    end
endmodule
