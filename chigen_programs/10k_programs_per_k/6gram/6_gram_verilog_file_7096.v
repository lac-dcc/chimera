// Seed: 1505721912
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
    id_10,
    id_11
);
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always id_11 <= #1 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input logic   id_0
    , id_3,
    input supply0 id_1
);
  supply0 id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3
  );
  always @(negedge 1) begin : LABEL_0
    id_3 <= 1;
    $display(id_3);
    id_3 <= "";
    $display(1);
    if (id_4) begin : LABEL_0
      if (~id_1) begin : LABEL_0
        id_4 = 1;
      end else #1 $display(1 & 1 | id_3, 1, {1'd0, 1});
    end else id_3 <= id_0;
  end
endmodule
