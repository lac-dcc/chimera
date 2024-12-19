// Seed: 2028226533
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3 = 1;
endmodule
module module_1 #(
    parameter id_24 = 32'd70,
    parameter id_25 = 32'd68
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23
);
  input wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(id_11 or id_1) begin : LABEL_0
    assume #1  (1) $display(1, !id_12, id_14);
    if ((id_6) + "") begin : LABEL_0
      id_13 <= id_15;
    end else begin : LABEL_0
      id_21 <= id_11;
      if (id_4 == 1) begin : LABEL_0
        id_22 <= "";
        id_10 = id_17[1];
        #1 id_8 = 1;
        $display(1, id_10, 1, 1'b0, 1);
      end
    end
  end
  defparam id_24.id_25 = 1;
  module_0 modCall_1 (
      id_18,
      id_10,
      id_3,
      id_16
  );
endmodule
