// Seed: 3929539945
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input wand id_2,
    input supply0 id_3,
    output wand id_4,
    input wor id_5,
    input wire id_6,
    input supply1 id_7,
    output tri1 id_8,
    input wire id_9,
    input wire id_10,
    input supply1 id_11,
    input tri id_12,
    input tri id_13
    , id_17,
    input supply0 id_14,
    output uwire id_15
);
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd49,
    parameter id_7 = 32'd37
) (
    output tri1 id_0,
    input uwire id_1,
    output wire id_2,
    input uwire id_3,
    input wand _id_4,
    input wand id_5,
    input supply1 id_6,
    input uwire _id_7,
    input supply1 id_8,
    input wire id_9,
    output logic id_10,
    output supply0 id_11,
    output supply0 id_12
);
  wire [id_7 : id_4] id_14;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_8,
      id_3,
      id_0,
      id_3,
      id_3,
      id_6,
      id_11,
      id_8,
      id_9,
      id_1,
      id_3,
      id_6,
      id_3,
      id_0
  );
  assign modCall_1.type_20 = 0;
  wire id_15;
  localparam id_16 = 1;
  bit id_17;
  ;
  assign id_2 = 1;
  always @(posedge -1 + -1'b0) begin : LABEL_0
    begin : LABEL_1
      id_17 <= id_8;
      id_10 <= id_1;
    end
  end
endmodule
