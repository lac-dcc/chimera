// Seed: 2904357914
module module_0;
  wand  id_2;
  uwire id_3;
  wand  id_4;
  generate
    assign id_3 = 1;
  endgenerate
  id_5 :
  assert property (@(posedge 1'd0) 1'b0 == id_2)
  else $display(1, id_2, id_2, 1, 1'b0, 1, 1);
  assign id_4 = 1 & (id_2) + id_1++;
  wire id_6;
endmodule
module module_1 (
    output tri  id_0,
    output wand id_1
);
  id_3(
      .id_0(id_0), .id_1(id_1)
  ); module_0();
endmodule
