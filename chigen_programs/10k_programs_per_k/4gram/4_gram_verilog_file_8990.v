// Seed: 2044461774
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri id_4,
    input tri0 id_5,
    output tri0 id_6,
    input wand id_7,
    output supply1 id_8,
    input wor id_9
);
  parameter id_11 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd21,
    parameter id_8 = 32'd19
) (
    output logic id_0,
    input tri0 _id_1,
    input tri0 id_2,
    input supply1 id_3,
    output tri0 id_4,
    output logic id_5,
    input tri id_6,
    input tri id_7,
    input uwire _id_8,
    input uwire id_9,
    output logic id_10,
    output wire id_11
    , id_18,
    input supply1 id_12,
    input supply1 id_13,
    input tri1 id_14,
    output supply0 id_15,
    input supply1 id_16
);
  always @(-1) begin : LABEL_0
    id_5 <= -1;
  end
  module_0 modCall_1 (
      id_16,
      id_11,
      id_2,
      id_4,
      id_14,
      id_2,
      id_15,
      id_3,
      id_15,
      id_16
  );
  logic [7:0] id_19;
  assign id_11 = id_9;
  logic [id_8 : 1  ==  id_1] id_20 = 1'b0;
  always @(posedge 1, posedge id_20)
    if (1) begin : LABEL_1
      id_10 <= 1;
    end else id_0 <= id_19[-1 : id_1];
endmodule
