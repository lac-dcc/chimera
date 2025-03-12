// Seed: 2886680064
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input wire id_2,
    input uwire id_3,
    output wire id_4,
    output tri id_5,
    input uwire id_6,
    input tri0 id_7,
    input supply0 id_8,
    input uwire id_9,
    input wor id_10,
    output tri id_11,
    output tri id_12,
    input tri0 id_13,
    input wor id_14,
    input wire id_15,
    input wire id_16,
    input supply1 id_17,
    output tri0 id_18,
    input tri id_19,
    output logic id_20,
    output tri0 id_21,
    input wor id_22,
    input wand id_23,
    input tri0 id_24,
    input tri id_25,
    output uwire id_26,
    output uwire id_27,
    input tri id_28,
    input tri1 id_29,
    input uwire id_30,
    output tri0 id_31,
    input tri id_32,
    input uwire id_33,
    output wand id_34
);
  always @(posedge -1'd0 or posedge 1) if (-1) id_20 <= -1;
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd83,
    parameter id_8  = 32'd72
) (
    output wire id_0,
    input wor id_1,
    input tri1 id_2,
    output wor id_3,
    output tri id_4,
    input tri1 id_5,
    input tri0 id_6,
    output wire id_7,
    input supply0 _id_8,
    inout supply1 id_9,
    input tri id_10,
    output supply1 id_11,
    output supply1 id_12,
    input wire _id_13,
    input wand id_14,
    input wire id_15,
    output supply0 id_16,
    input uwire id_17,
    output logic id_18,
    input tri id_19,
    input tri1 id_20,
    input wor id_21,
    input uwire id_22,
    output tri0 id_23,
    input tri id_24,
    input wand id_25
);
  logic [id_13 : -1 'b0] id_27 = -1'b0;
  logic [7:0] id_28[id_8 : 1  ~^  -1];
  module_0 modCall_1 (
      id_4,
      id_7,
      id_6,
      id_9,
      id_7,
      id_11,
      id_21,
      id_17,
      id_24,
      id_22,
      id_19,
      id_4,
      id_7,
      id_17,
      id_10,
      id_6,
      id_2,
      id_20,
      id_4,
      id_5,
      id_18,
      id_12,
      id_24,
      id_1,
      id_1,
      id_19,
      id_11,
      id_7,
      id_24,
      id_15,
      id_24,
      id_0,
      id_15,
      id_22,
      id_0
  );
  assign id_3 = -1;
  always @(posedge -1'd0) begin : LABEL_0
    $unsigned(7);
    ;
    id_18 = id_28[SystemTFIdentifier];
  end
endmodule
