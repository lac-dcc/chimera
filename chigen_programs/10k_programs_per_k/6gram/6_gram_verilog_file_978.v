// Seed: 1973073076
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  logic [7:0] id_3;
  assign id_3[1] = id_1;
endmodule
module module_1 #(
    parameter id_18 = 32'd91,
    parameter id_19 = 32'd53
) (
    input logic id_0,
    output logic id_1,
    output tri0 id_2,
    input wand id_3,
    input tri1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wire id_7,
    input wand id_8,
    input wire id_9,
    input tri0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    inout logic id_13,
    input wand id_14,
    output logic id_15
);
  assign id_1 = id_13;
  always @(negedge id_10 - id_14)
    if (id_14) begin : LABEL_0
      id_13 <= id_0;
      id_2 = id_7;
    end else id_15 <= "";
  wire id_17;
  module_0 modCall_1 (
      id_17,
      id_17
  );
  defparam id_18.id_19 = id_18;
endmodule
