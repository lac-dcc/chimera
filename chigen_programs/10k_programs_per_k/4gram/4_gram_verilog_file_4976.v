// Seed: 3330541341
module module_0 (
    output uwire id_0,
    input wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    input wand id_4
);
  id_6 :
  assert property (@(posedge id_4) 1'h0)
  else $display;
  wor  id_7;
  wire id_8;
  assign id_7 = id_6;
  wire id_9;
  wire  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  wire id_24;
  wire id_25;
endmodule
module module_1 (
    output tri id_0,
    input tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    input tri id_4,
    input wand id_5,
    output tri0 id_6,
    output wor id_7,
    output wor id_8,
    input tri0 id_9
);
  always_ff @(posedge id_9 or posedge 1) begin
    assign id_7 = 1'h0;
  end
  module_0(
      id_7, id_2, id_5, id_9, id_5
  );
  assign id_8 = 1'b0;
endmodule
