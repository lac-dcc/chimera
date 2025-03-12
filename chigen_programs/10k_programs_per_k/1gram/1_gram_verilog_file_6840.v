// Seed: 610691446
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_27 = 32'd28
) (
    input wand id_0,
    output uwire id_1,
    input wor id_2,
    input wire id_3,
    input wand id_4,
    input tri1 id_5,
    input wor id_6
    , id_23,
    input tri id_7,
    output supply1 id_8,
    input supply1 id_9,
    output tri id_10,
    output supply0 id_11[-1 : 1],
    output wand id_12,
    output logic id_13,
    input tri id_14,
    input supply0 id_15,
    output wand id_16,
    output tri0 id_17,
    output tri0 id_18,
    output wor id_19,
    input tri id_20
    , id_24,
    input wand id_21
);
  struct packed {logic id_25;} id_26;
  parameter id_27 = -1;
  union packed {
    logic id_28;
    logic id_29;
  } id_30;
  assign id_10 = -1;
  module_0 modCall_1 (
      id_23,
      id_28,
      id_23,
      id_23,
      id_23,
      id_29
  );
  xnor primCall (
      id_16,
      id_29,
      id_6,
      id_14,
      id_9,
      id_3,
      id_24,
      id_15,
      id_4,
      id_20,
      id_5,
      id_21,
      id_27,
      id_2,
      id_23,
      id_28,
      id_30,
      id_0,
      id_25
  );
  assign id_10 = -1'b0 + 1;
  defparam id_27 = 1 & id_27;
  always_ff @(posedge -1'b0) begin : LABEL_0
    id_13 <= #1 id_26[1].sum;
  end
endmodule
