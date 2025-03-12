// Seed: 3836686978
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input uwire id_2,
    input tri1 id_3,
    input tri id_4,
    output supply0 id_5,
    output tri id_6,
    input wor id_7,
    input supply0 id_8,
    output uwire id_9,
    input uwire id_10
);
  wire id_12;
  assign module_1.id_11 = 0;
  wire id_13;
endmodule
module module_1 #(
    parameter id_14 = 32'd36
) (
    input supply1 id_0,
    output tri id_1,
    output supply1 id_2,
    output uwire id_3,
    input wire id_4,
    input tri0 id_5,
    input wand id_6,
    input uwire id_7,
    output uwire id_8,
    output wire id_9,
    output logic id_10,
    input wand id_11,
    input tri id_12,
    output uwire id_13,
    input tri1 _id_14,
    input uwire id_15,
    input tri1 id_16
);
  always @(id_14) begin : LABEL_0
    id_10 <= id_7 < 1;
  end
  logic id_18;
  ;
  assign id_2 = id_6;
  wire ["" : id_14] id_19;
  assign id_13 = id_4;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_6,
      id_4,
      id_4,
      id_13,
      id_13,
      id_7,
      id_11,
      id_2,
      id_5
  );
  always_comb @(*)
    if (1) begin : LABEL_1
      id_10 <= 1;
    end
  assign id_3 = id_14;
  logic id_20;
endmodule
