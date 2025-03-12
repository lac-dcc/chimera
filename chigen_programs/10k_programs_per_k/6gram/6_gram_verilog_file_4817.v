// Seed: 253765734
module module_0 (
    input wand id_0,
    input wire id_1,
    input uwire id_2,
    output wand id_3,
    input uwire id_4,
    input supply1 id_5,
    output supply0 id_6,
    input wand id_7,
    input wor id_8,
    input uwire id_9,
    input supply0 id_10,
    input wire id_11,
    input tri0 id_12,
    input wand id_13,
    output wand id_14,
    input tri0 id_15,
    input tri0 id_16,
    input supply1 id_17,
    input tri0 id_18,
    input wire id_19,
    input supply0 id_20,
    input tri1 id_21,
    output uwire id_22,
    output tri0 id_23,
    input wor id_24,
    output tri0 id_25,
    input uwire id_26,
    input tri0 id_27,
    input wand id_28,
    input tri id_29
);
endmodule
module module_1 #(
    parameter id_8 = 32'd14
) (
    output logic id_0,
    input wand id_1,
    output supply1 id_2
);
  logic [7:0] id_4, id_5;
  assign id_2 = id_1;
  reg  id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1
  );
  parameter id_8 = 1;
  logic id_9;
  ;
  parameter id_10 = 1'b0;
  generate
    if (-1 || -1 - id_8) begin : LABEL_0
      defparam id_8.id_8 = id_8;
      assign id_7 = id_9;
    end else
      always @(posedge 1 - id_10) begin : LABEL_1
        id_9 = 1;
        id_5[-1] = -1;
        cover (id_7);
        id_0 <= id_9;
        id_6 = -1'b0;
      end
  endgenerate
  wire id_11;
endmodule
