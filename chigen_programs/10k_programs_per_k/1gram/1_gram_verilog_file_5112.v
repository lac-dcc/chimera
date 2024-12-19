// Seed: 1906622917
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_5;
  logic [7:0][1 : 1] id_6;
  initial id_2 = id_5;
  always @(id_1) begin : LABEL_0
    begin : LABEL_0
      id_3 <= #id_6 1'b0;
    end
    id_2 <= id_2;
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign {id_2 - 1, {1, 1, "", !1}} = 1'h0;
  id_3(
      1, 1, (1), id_2 | 1 & 'd0, 1'd0, 1
  );
  always @(id_2, posedge id_1 - 1'b0) id_1 <= id_2;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_4
  );
  wire id_5, id_6;
endmodule
