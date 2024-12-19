// Seed: 1541402932
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign module_1.id_16 = 0;
  wire id_3, id_4, id_5, id_6, id_7, id_8;
endmodule
module module_1 (
    output wor id_0,
    input logic id_1,
    input supply0 id_2,
    input supply0 id_3,
    input wor id_4,
    input supply0 id_5,
    input logic id_6
    , id_14,
    output supply0 id_7
    , id_15,
    input tri0 id_8,
    input wire id_9,
    input tri1 id_10,
    output tri0 id_11,
    output logic id_12
);
  logic id_16, id_17;
  generate
    wire id_18;
    assign id_11 = 1'b0;
    always_latch
      if (id_8) $display(1'h0);
      else if (1 & 1'b0) id_16 = id_6;
  endgenerate
  task id_19;
    begin : LABEL_0
      id_14 <= 1'd0;
      id_15 = id_17;
      if (id_3) begin : LABEL_0
        id_0 = 1;
      end else id_19 <= 1'b0;
      id_19 <= id_6;
      begin : LABEL_0
        id_15 <= id_16++;
      end
    end
    if (id_2) @(posedge id_14) id_12 <= id_1;
  endtask
  wire id_20, id_21;
  wire id_22;
  module_0 modCall_1 (
      id_20,
      id_20
  );
  wire id_23, id_24;
  assign id_17 = 1;
  wire id_25;
endmodule
