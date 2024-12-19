// Seed: 1229503291
module module_0;
  generate
    always begin : LABEL_0
      id_1 <= 1'h0;
    end
  endgenerate
  wire id_2;
  wire id_3;
  tri0 id_4;
  assign id_4 = 1;
  supply0 id_5 = 1;
endmodule
module module_1 (
    input  logic id_0,
    output logic id_1
);
  always begin : LABEL_0
    id_1 = {1'b0{id_0}};
    id_1 = #1 1;
  end
  wire id_3;
  wire id_4;
  id_5(
      .id_0(id_3)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_5 = 0;
endmodule
module module_2;
  assign id_1 = 1;
  assign id_1 = id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_4 = 0;
  id_2 :
  assert property (@(posedge id_1) id_1)
  else;
  wire id_3;
  wire id_4, id_5, id_6, id_7, id_8 = id_7, id_9, id_10, id_11, id_12, id_13, id_14;
endmodule
