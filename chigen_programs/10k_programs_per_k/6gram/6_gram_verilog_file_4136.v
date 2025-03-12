// Seed: 236380289
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
  output reg id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial id_7 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output logic [7:0] id_4;
  output reg id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_3,
      id_5
  );
  input wire id_1;
  initial begin : LABEL_0
    id_4[(-1'h0)] = id_2 != 1'd0;
    if (-1) begin : LABEL_1
      id_3 += id_1;
      id_3 <= #1 id_5;
    end else $clog2(4);
    ;
  end
  or primCall (id_5, id_1, id_2);
endmodule
