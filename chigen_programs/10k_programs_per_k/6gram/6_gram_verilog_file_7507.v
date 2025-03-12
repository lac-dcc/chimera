// Seed: 168918308
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input wire id_2
    , id_20,
    output uwire id_3,
    input supply0 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    input tri1 id_9,
    input supply0 id_10,
    input tri1 id_11,
    input wor id_12,
    input supply0 id_13,
    input tri0 id_14,
    input supply0 id_15,
    input wor id_16,
    input wire id_17,
    output logic id_18
);
  wire id_21;
  always @(negedge id_4) begin : LABEL_0
    id_18#(1'b0, -1, 1) <= ({id_0, id_21});
  end
  assign module_1.id_24 = 0;
endmodule
module module_0 #(
    parameter id_14 = 32'd7
) (
    input wire id_0,
    input wire id_1,
    input wor id_2,
    output wire id_3,
    input wor id_4,
    input supply1 id_5,
    output tri0 id_6,
    output wire id_7,
    input supply0 id_8,
    input wand id_9,
    input tri1 id_10,
    output tri1 id_11,
    output logic id_12,
    input wand id_13,
    input wor _id_14,
    input supply0 id_15,
    output logic id_16,
    input tri0 id_17,
    input wire id_18,
    output supply1 id_19,
    input tri id_20,
    input wand id_21,
    inout wire module_1
    , id_31,
    output supply1 id_23,
    input uwire id_24,
    output uwire id_25,
    output tri id_26,
    output tri id_27,
    output wire id_28,
    output logic id_29
);
  assign id_12 = id_21;
  assign id_28 = -1;
  logic [7:0] id_32;
  ;
  always @(id_18, id_17 == -1'd0 or posedge 1 - id_18 or posedge -1) begin : LABEL_0
    begin : LABEL_1
      id_32[id_14] <= -1;
      id_12 = id_9 == 1;
    end
    id_29 <= id_15;
  end
  wire [-1 : -1 'b0 ==  -1] id_33;
  module_0 modCall_1 (
      id_8,
      id_28,
      id_5,
      id_11,
      id_13,
      id_27,
      id_8,
      id_15,
      id_4,
      id_24,
      id_8,
      id_4,
      id_4,
      id_24,
      id_17,
      id_21,
      id_15,
      id_8,
      id_12
  );
  always @(*) begin : LABEL_2
    id_16 <= id_18;
  end
endmodule
