// Seed: 2552628833
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  initial
    #1
      if ((id_2 || 1)) begin : LABEL_0
        id_1 = 1'b0;
        $display(1);
      end else id_3 <= 1;
  assign module_1.id_10 = 0;
  wire id_5;
  assign id_4 = id_5;
endmodule
module module_0 (
    input logic id_0,
    output logic id_1,
    input logic id_2,
    input supply1 id_3,
    input tri1 module_1,
    output tri1 id_5
);
  logic id_7;
  assign id_5 = ~id_2 != 1 + id_7;
  reg id_8;
  logic id_9, id_10;
  reg id_11;
  always @(posedge {id_0,
    id_7
  })
  begin : LABEL_0
    id_8 <= id_11;
    id_9 <= id_10;
    if (id_4) id_11 <= #1 id_2;
  end
  wire id_12;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_11
  );
  assign id_1 = (1 ? id_9 : 1 - id_2);
  wire  id_13;
  logic id_14 = id_7 ? id_9 : 1;
  wire  id_15;
  wire  id_16;
  assign id_10 = id_0;
endmodule
