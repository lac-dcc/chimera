// Seed: 3134017967
module module_0 (
    input wor id_0,
    input wor id_1,
    input uwire id_2,
    input wand id_3,
    input supply1 id_4,
    input tri1 id_5
);
  wor id_7;
  reg id_8;
  assign id_8 = 1'b0;
  always_comb @(posedge id_5) @(posedge id_0) id_8 <= 1;
  assign id_7 = 1'b0;
  initial begin
    id_8 <= 1;
  end
  initial assume (1'd0);
endmodule
module module_1 (
    input wand id_0,
    input tri  id_1
);
  wire id_3;
  module_0(
      id_0, id_1, id_1, id_0, id_1, id_1
  );
endmodule
