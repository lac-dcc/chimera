// Seed: 2188988370
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri id_2,
    output tri1 id_3
);
  assign id_3 = id_1;
  wor  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ;
  assign id_14 = 1;
endmodule
module module_1 (
    output wand id_0,
    input wor id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4,
    output supply1 id_5,
    input tri1 id_6,
    output tri id_7
);
  uwire id_9 = 1'b0;
  wire  id_10;
  assign id_9 = 1 ? id_9 : id_1;
  initial begin
    id_7 = id_4;
    if (id_9) begin
      id_5 = id_4;
    end else begin
      id_0 = 1 * 1'd0;
    end
  end
  module_0(
      id_6, id_2, id_4, id_9
  );
endmodule
