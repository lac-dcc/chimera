// Seed: 1594953261
module module_0 (
    input tri id_0,
    input uwire id_1,
    output supply1 id_2
);
  assign id_2 = id_1;
  wire id_4;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wor id_2,
    input supply0 id_3,
    output logic id_4,
    output wire id_5,
    output wand id_6,
    input supply1 id_7,
    input logic id_8,
    output supply0 id_9,
    input supply1 id_10,
    input tri id_11,
    output wor id_12
);
  id_14 :
  assert property (@(posedge id_1) id_7 || id_3)
  else begin
    id_4 <= 1'b0;
    #1;
    assign id_0.id_8 = id_8;
    id_5 = 1'b0;
  end
  or (id_6, id_1, id_11, id_14, id_3, id_10, id_7, id_8);
  module_0(
      id_3, id_10, id_6
  );
endmodule
