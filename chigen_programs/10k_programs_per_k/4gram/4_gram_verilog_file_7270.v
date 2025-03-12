// Seed: 5085608
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input wire id_2,
    output tri1 id_3,
    input tri id_4,
    input supply0 id_5,
    output wand id_6,
    output wand id_7,
    output wire id_8,
    output supply1 id_9,
    input tri id_10,
    input tri id_11,
    output supply0 id_12,
    input uwire id_13,
    output uwire id_14
);
endmodule
module module_1 #(
    parameter id_8 = 32'd71,
    parameter id_9 = 32'd29
) (
    input tri1 id_0,
    output tri1 id_1,
    output logic id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wand id_5,
    output supply1 id_6,
    output logic id_7,
    output tri _id_8,
    input wire _id_9
);
  always @(posedge "", -1'b0)
    #1 begin : LABEL_0
      id_7 = 1;
      for (id_7 = id_3; -1; id_2 = -1) begin : LABEL_1
        id_2 <= id_4;
      end
    end
  integer [id_8 : -1 'b0] id_11;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_3,
      id_1,
      id_4,
      id_4,
      id_5,
      id_1,
      id_6,
      id_5,
      id_3,
      id_0,
      id_6,
      id_3,
      id_1
  );
  assign modCall_1.id_13 = 0;
  wire [id_9 : -1] id_12;
  wire id_13;
endmodule
