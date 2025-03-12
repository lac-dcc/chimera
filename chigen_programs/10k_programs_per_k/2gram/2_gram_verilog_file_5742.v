// Seed: 708343117
module module_0 #(
    parameter id_22 = 32'd83
) (
    output tri1 id_0,
    output wor id_1,
    output uwire id_2,
    input supply0 id_3,
    input wire id_4,
    input wor id_5,
    output supply1 id_6,
    input tri1 id_7,
    input wor id_8,
    input tri id_9,
    input tri id_10,
    input wand id_11,
    output wire id_12,
    output uwire id_13,
    input tri0 id_14,
    input tri id_15,
    input wand id_16,
    input supply1 id_17
);
  wire id_19 = id_10;
  wire id_20;
  wire id_21;
  parameter id_22 = 1;
  wire  id_23;
  logic id_24;
  ;
  logic id_25 = !1;
  assign id_2 = -1;
  assign module_1.id_4 = 0;
  for (id_26 = id_21; ($realtime != id_26); id_25 = {id_3{id_8}} & id_16) begin : LABEL_0
    assign id_13 = 1;
    assign id_21 = id_7;
    logic id_27;
    defparam id_22.id_22 = ~id_22;
  end
  assign id_6  = id_22;
  defparam id_22.id_22 = id_22;
  assign id_25 = 1'd0;
  wire id_28;
endmodule
module module_1 #(
    parameter id_17 = 32'd75
) (
    input tri0 id_0,
    input tri0 id_1,
    input wand id_2,
    output wire id_3,
    input tri0 id_4,
    input wire id_5,
    input wand id_6,
    input supply0 id_7,
    output uwire id_8,
    input wire id_9,
    input wor id_10,
    output supply1 id_11,
    output wor id_12,
    input tri1 id_13,
    input tri1 id_14,
    input supply0 id_15,
    input tri1 id_16,
    inout tri1 _id_17,
    input tri0 id_18,
    input wand id_19,
    input tri0 id_20,
    output tri id_21,
    input wire id_22,
    output tri id_23,
    output tri0 id_24,
    input uwire id_25,
    input tri0 id_26,
    input wire id_27,
    input uwire id_28,
    input tri0 id_29,
    input tri1 id_30,
    input tri0 id_31
);
  wire id_33;
  module_0 modCall_1 (
      id_23,
      id_24,
      id_23,
      id_6,
      id_9,
      id_5,
      id_21,
      id_2,
      id_7,
      id_30,
      id_14,
      id_26,
      id_21,
      id_12,
      id_25,
      id_6,
      id_4,
      id_27
  );
  logic [1 : id_17] id_34 = 1;
endmodule
