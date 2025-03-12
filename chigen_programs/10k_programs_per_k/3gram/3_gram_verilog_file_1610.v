// Seed: 1580206468
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wor id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input tri id_8,
    input tri1 id_9,
    input supply0 id_10,
    input wand id_11,
    input uwire id_12
);
  initial cover (id_3);
  logic id_14;
  assign id_14 = id_8;
  initial begin : LABEL_0
    id_14 <= id_11;
    $unsigned(95);
    ;
  end
  logic id_15;
  assign id_15 = id_12;
  wire id_16;
  always @(posedge id_14);
endmodule
module module_1 #(
    parameter id_19 = 32'd58,
    parameter id_9  = 32'd95
) (
    input wand id_0,
    output tri0 id_1,
    input uwire id_2,
    output wand id_3,
    input supply1 id_4,
    input wand id_5,
    output wand id_6,
    output supply0 id_7,
    input tri1 id_8,
    input wire _id_9,
    input wor id_10,
    output wire id_11,
    output tri0 id_12,
    output wire id_13,
    output logic id_14,
    output tri id_15,
    output tri0 id_16,
    output wire id_17,
    input wor id_18,
    input wor _id_19,
    output tri1 id_20,
    input tri0 id_21,
    input supply1 id_22,
    input wand id_23,
    output tri1 id_24,
    input tri id_25
    , id_28,
    output uwire id_26
);
  always @(id_19) begin : LABEL_0
    id_14 <= id_28;
    assume (id_10);
  end
  module_0 modCall_1 (
      id_4,
      id_20,
      id_4,
      id_8,
      id_4,
      id_18,
      id_21,
      id_7,
      id_2,
      id_0,
      id_18,
      id_4,
      id_2
  );
  localparam id_29 = -1;
  wire [id_9 : id_19] id_30;
  parameter id_31 = {1, 1, id_29};
  parameter id_32 = id_29;
endmodule
