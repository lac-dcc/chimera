// Seed: 1001540582
module module_0 (
    input supply0 id_0,
    output logic id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    output wire id_10,
    output wor id_11
);
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      begin : LABEL_2
        id_1 <= id_5 && -1;
      end
    end
  end
  assign id_10 = 1'b0 === 1'b0;
  localparam id_13 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd59,
    parameter id_4 = 32'd63,
    parameter id_5 = 32'd26,
    parameter id_8 = 32'd40
) (
    output tri   id_0,
    output logic id_1,
    input  wand  _id_2,
    output wire  id_3,
    input  uwire _id_4,
    input  uwire _id_5,
    input  wor   id_6,
    output wor   id_7,
    input  uwire _id_8,
    input  uwire id_9
);
  wire id_11 = id_5;
  initial if ("") id_1 = id_2;
  buf primCall (id_1, id_9);
  module_0 modCall_1 (
      id_6,
      id_1,
      id_7,
      id_6,
      id_9,
      id_9,
      id_9,
      id_6,
      id_9,
      id_6,
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
  wire [id_5  ^  id_4  ==  id_8 : 1] id_12;
  wire [id_2 : 1] id_13;
  parameter id_14 = ~1;
endmodule
