// Seed: 307283488
module module_0 (
    output tri0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output tri id_3,
    output tri1 id_4,
    input tri0 id_5
    , id_15,
    input uwire id_6,
    output supply0 id_7,
    input supply1 id_8,
    output wor id_9,
    output tri1 id_10,
    input supply1 id_11,
    output wand id_12,
    input tri1 id_13
);
  assign id_9 = id_5;
  always @(posedge 1) begin : LABEL_0
    id_15 <= id_5;
  end
endmodule
module module_1 #(
    parameter id_5 = 32'd2
) (
    input tri1 id_0,
    output logic id_1,
    output supply1 id_2,
    output logic id_3
);
  logic _id_5;
  ;
  always @(posedge id_0 or negedge id_5 << id_0) id_1 = 1'b0;
  reg [-1 : id_5] id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_13 = 0;
  logic id_7 = 1'b0, id_8, id_9;
  always begin : LABEL_0
    if (1) id_7 <= !id_7;
    else begin : LABEL_1
      if (-1)
        if (-1) id_6 <= id_8;
        else if (-1) id_3 = -1;
        else begin : LABEL_2
          id_8 <= -1;
        end
    end
  end
  wire  id_10;
  logic id_11;
endmodule
