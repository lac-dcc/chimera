// Seed: 1574403833
module module_0 (
    output tri   id_0,
    input  uwire id_1,
    output logic id_2
);
  always @* id_2 = 1;
  wire id_4;
  assign id_0 = id_4;
endmodule
module module_1 #(
    parameter id_1 = 32'd33,
    parameter id_2 = 32'd28,
    parameter id_5 = 32'd76
) (
    input tri1 id_0,
    input supply0 _id_1,
    input wand _id_2,
    input uwire id_3,
    output wire id_4,
    input supply0 _id_5,
    input tri id_6,
    input tri1 id_7,
    output supply1 id_8,
    output supply1 id_9,
    input uwire id_10,
    input tri id_11,
    output tri id_12,
    output logic id_13,
    inout wor id_14,
    input supply1 id_15,
    output wor id_16
);
  parameter id_18 = -1;
  bit id_19;
  ;
  logic [id_5 : id_1] id_20;
  module_0 modCall_1 (
      id_14,
      id_15,
      id_13
  );
  assign modCall_1.id_1 = 0;
  logic id_21;
  ;
  always @(posedge -1 or -1) begin : LABEL_0
    id_19 <= id_15;
    if (id_18[id_2]) begin : LABEL_1
      id_13 <= -1;
    end
  end
endmodule
