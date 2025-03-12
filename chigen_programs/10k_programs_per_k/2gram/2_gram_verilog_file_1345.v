// Seed: 4091860476
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  assign module_1.id_1 = 0;
  inout logic [7:0] id_1;
  assign id_4[-1] = id_5 ? 1 : 1 ? "" : id_1[-1];
endmodule
module module_1 #(
    parameter id_9 = 32'd28
) (
    input wor id_0,
    input tri1 id_1,
    input wor id_2,
    output supply1 id_3,
    input tri id_4,
    input tri id_5,
    input supply0 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input uwire _id_9,
    output tri1 id_10,
    input wand id_11,
    output supply0 id_12,
    input tri id_13,
    input tri1 id_14,
    input supply1 id_15,
    input wire id_16
);
  logic [7:0][1 : -1  +  id_9] id_18;
  assign id_18[1] = 1 & id_1;
  localparam integer id_19 = 1;
  module_0 modCall_1 (
      id_18,
      id_19,
      id_19,
      id_18,
      id_19
  );
  localparam id_20 = 1'b0, id_21 = -1;
  always
    if (id_19) disable id_22;
    else
      @(negedge 1)
        if (id_21 == -1) begin : LABEL_0
          id_22 <= id_16;
        end
  logic id_23;
  assign id_23 = -1;
  assign id_22 = !id_23 ^ id_4;
endmodule
