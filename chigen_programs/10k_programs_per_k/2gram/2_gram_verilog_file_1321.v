// Seed: 305012569
module module_0 ();
  wire id_1;
  module_3 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  always @(*) cover (id_1 ? id_1 : id_1);
  id_2(
      .id_0({1, id_1, id_3})
  );
  assign id_3 = 1;
  module_0 modCall_1 ();
endmodule
module module_2;
  generate
    assign id_1 = id_1;
  endgenerate
  module_0 modCall_1 ();
  assign id_1 = id_1;
endmodule
module module_3 ();
  id_1 :
  assert property (@(posedge 1'b0) id_1)
  else;
  always begin : LABEL_0
    disable id_2;
    @(posedge id_2) id_1 <= id_1;
  end
endmodule
