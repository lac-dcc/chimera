// Seed: 2368701759
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input wor id_2
    , id_22,
    output tri id_3,
    output tri0 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wor id_8,
    input supply0 id_9,
    output wand id_10,
    input wand id_11,
    input tri0 id_12,
    input tri0 id_13,
    output wand id_14,
    input tri1 id_15,
    output tri1 id_16,
    output wor id_17,
    output supply0 id_18,
    output wand id_19,
    output uwire id_20
);
  supply0 id_23 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd14,
    parameter id_6  = 32'd55
) (
    output logic id_0,
    output supply1 id_1,
    output wor id_2,
    output logic id_3,
    input wand id_4,
    output uwire id_5,
    input tri0 _id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wor id_9,
    input wire id_10,
    input wand _id_11,
    input wand id_12,
    input wire id_13,
    input wire id_14
    , id_18,
    input supply1 id_15,
    input supply1 id_16
);
  logic [id_11 : -1 'b0] id_19;
  logic id_20;
  wire id_21;
  wire id_22;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_16,
      id_1,
      id_5,
      id_16,
      id_14,
      id_9,
      id_16,
      id_9,
      id_5,
      id_4,
      id_10,
      id_13,
      id_5,
      id_14,
      id_1,
      id_5,
      id_1,
      id_1,
      id_1
  );
  assign id_3 = -1;
  assign id_19[id_6] = id_13;
  assign id_20[-1*-1] = -1'b0;
  wire id_23, id_24;
  final $unsigned(54);
  ;
  initial begin : LABEL_0
    id_0 <= id_11;
    if (1) begin : LABEL_1
      id_3 <= id_22;
    end else begin : LABEL_2
      id_18 = -1;
    end
  end
  wire id_25;
  nor primCall (
      id_1,
      id_9,
      id_18,
      id_10,
      id_14,
      id_21,
      id_19,
      id_15,
      id_20,
      id_13,
      id_7,
      id_12,
      id_16,
      id_4,
      id_22
  );
endmodule
