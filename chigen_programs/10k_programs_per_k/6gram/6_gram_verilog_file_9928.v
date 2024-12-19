// Seed: 2697447796
module module_0 #(
    parameter id_7 = 32'd2,
    parameter id_8 = 32'd31
) (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  uwire id_3 = 1;
  generate
    wire id_4;
    for (id_5 = id_3 == 1; id_5; id_5 = id_5) begin : LABEL_0
      assign id_3 = 1;
    end
  endgenerate
  generate
    for (id_6 = 1; id_2; id_5 = id_1) begin : LABEL_0
      defparam id_7.id_8 = id_4;
    end
  endgenerate
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    output uwire id_2,
    output supply0 id_3,
    input wand id_4,
    input wor id_5,
    input tri1 id_6,
    input supply0 id_7,
    output wor id_8,
    input wire id_9,
    input uwire id_10,
    input uwire id_11,
    input tri1 id_12,
    output wire id_13,
    input tri0 id_14,
    output tri0 id_15,
    input supply0 id_16,
    input uwire id_17,
    input supply0 id_18,
    input wire id_19,
    output wire id_20,
    output tri id_21,
    input wor id_22,
    input supply0 id_23,
    input wand id_24,
    output tri id_25
    , id_30, id_31,
    output supply1 id_26,
    input uwire id_27,
    output wor id_28
);
  wire id_32;
  assign id_13 = 1;
  module_0 modCall_1 (
      id_32,
      id_32
  );
  always @(negedge id_0) begin : LABEL_0
    wait (1'h0);
  end
endmodule
