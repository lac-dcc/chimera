// Seed: 2183535149
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3,
    output wand id_4,
    input tri id_5,
    input uwire id_6,
    input uwire id_7,
    output wor id_8
);
endmodule
module module_0 #(
    parameter id_1 = 32'd82,
    parameter id_3 = 32'd58,
    parameter id_6 = 32'd24,
    parameter id_8 = 32'd37
) (
    output logic id_0,
    input supply1 _id_1,
    output wor id_2,
    input wire _id_3,
    input tri1 id_4,
    input uwire id_5,
    input supply1 _id_6,
    input wor id_7,
    input tri _id_8,
    input tri0 id_9
);
  logic [-1 : id_1] id_11;
  logic id_12 = 1;
  wire id_13;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_2,
      id_9,
      id_2,
      id_4,
      id_5,
      id_5,
      id_2
  );
  logic [7:0][1 : module_1[(  -1  ) : id_8]] id_14;
  assign id_11 = -1;
  assign id_13 = id_13;
  always @(posedge id_6) begin : LABEL_0
    id_0 <= id_4;
    id_14[-1'b0 : id_3*-1*id_6] <= id_1;
  end
endmodule
