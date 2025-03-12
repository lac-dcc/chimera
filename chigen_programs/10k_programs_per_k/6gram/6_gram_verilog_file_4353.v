// Seed: 4212179330
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  assign module_2.id_23 = 0;
  output wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4
  );
  inout wire id_5;
  inout wire id_4;
  output uwire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_4 == -1;
  assign id_3 = -1;
endmodule
module module_2 #(
    parameter id_14 = 32'd20,
    parameter id_16 = 32'd35
) (
    input wand id_0,
    input wand id_1,
    input supply0 id_2,
    output tri0 id_3,
    output wor id_4,
    input wand id_5,
    input uwire id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output logic id_10,
    input wor id_11,
    input supply0 id_12,
    input supply1 id_13,
    input wire _id_14,
    input wor id_15,
    output supply0 _id_16
    , id_18
);
  reg [-1 : 1] id_19;
  logic id_20;
  wire id_21;
  wire id_22;
  logic [id_16 : 1 'b0] id_23;
  wire id_24;
  always @(*) begin : LABEL_0
    id_18[id_14] <= #id_22 1;
    id_19 = -1'b0 & 1'h0;
    id_23 <= (1);
    id_10 <= (1) - id_21;
  end
  module_0 modCall_1 (
      id_22,
      id_21,
      id_22
  );
endmodule
