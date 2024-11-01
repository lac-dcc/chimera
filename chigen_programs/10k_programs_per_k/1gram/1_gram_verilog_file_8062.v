// Seed: 105553463
module module_0;
  integer id_1;
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output supply1 id_2
    , id_7,
    input uwire id_3,
    input wor id_4
    , id_8 = 'b0,
    input wand id_5
);
  wire id_9;
  module_0();
  generate
    begin
      id_10(
          .id_0(id_1), .id_1((1)), .id_2((1)), .id_3(id_3), .id_4(1), .id_5(id_0), .id_6(1)
      );
      wire id_11;
    end
  endgenerate
  initial $display(id_3, id_8 - 1);
  id_12 :
  assert property (@(posedge id_7) id_8) id_2 = 1;
  wire id_13, id_14;
endmodule
