// Seed: 1643736835
module module_0 (
    input tri id_0,
    input wand id_1,
    input wand id_2,
    input uwire id_3,
    output wor id_4,
    input supply0 id_5,
    input wor id_6,
    output tri1 id_7,
    input tri1 id_8,
    output tri id_9,
    input wire id_10,
    output logic id_11,
    output wor id_12,
    input tri id_13,
    input supply0 id_14
);
  assign id_9 = 1;
  initial begin : LABEL_0
    id_11 <= id_2;
  end
  assign id_11 = id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd87,
    parameter id_4 = 32'd53
) (
    input wand id_0,
    input tri0 _id_1,
    input uwire id_2
    , id_9,
    input supply0 id_3,
    input wire _id_4,
    output wand id_5,
    input tri1 id_6,
    output logic id_7
);
  bit [-1 'd0 : -1] id_10;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_0,
      id_5,
      id_3,
      id_6,
      id_5,
      id_3,
      id_5,
      id_0,
      id_7,
      id_5,
      id_3,
      id_2
  );
  always_comb @(-1'b0 or negedge ~id_1) begin : LABEL_0
    id_7 <= 1;
  end
  always @(negedge id_9 or posedge id_10) begin : LABEL_1
    if ("")
      if (1) begin : LABEL_2
        id_9 = id_9;
      end else id_10 <= id_3 & id_6;
    else $signed(25);
    ;
  end
  supply0 [id_4 : id_1  -  id_1] id_11;
  assign id_11 = 1;
  wire id_12;
endmodule
