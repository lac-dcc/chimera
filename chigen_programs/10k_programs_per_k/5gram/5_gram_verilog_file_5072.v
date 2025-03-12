// Seed: 3900741247
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output logic [7:0] id_5;
  inout logic [7:0] id_4;
  output logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  generate
    always @(posedge -1) begin : LABEL_0
      wait (1);
    end
    if (1) begin : LABEL_1
      assign id_5[1'h0] = 1;
    end else begin : LABEL_2
      if (1) begin : LABEL_3
        assign id_4[1] = id_6.id_1;
        logic id_7;
        ;
      end else begin : LABEL_4
        assign id_3[""] = -1'h0;
      end
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_12 = 32'd24
) (
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
    id_11,
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output logic [7:0] id_13;
  input wire _id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_4,
      id_13,
      id_3
  );
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4[id_12] = 1'b0 == id_9;
  logic id_18;
  wire  id_19;
  wire  id_20;
endmodule
