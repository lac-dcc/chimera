// Seed: 4126188792
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  integer id_20 = 1;
  id_21(
      .id_0(id_2), .id_1(id_17)
  );
  always @(posedge !id_19) begin : LABEL_0
    if (1'b0)
      assume (1);
      else begin : LABEL_0
        id_2 = 1;
      end
  end
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  always @(posedge 1'b0 - id_2) begin : LABEL_0
    id_1 <= id_2;
    $display(1);
    id_1 <= id_2;
  end
  wire id_3;
  always @(posedge 1'd0) #1;
  wire id_5, id_6;
  assign id_3 = id_6;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_5,
      id_3,
      id_6,
      id_5,
      id_6,
      id_3,
      id_6,
      id_5,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_3
  );
  assign id_4 = 1;
endmodule
