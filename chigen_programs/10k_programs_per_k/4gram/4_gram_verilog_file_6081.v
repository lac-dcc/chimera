// Seed: 3614272217
module module_0;
  always @(id_1 or posedge 1)
    case (id_1)
      1: begin : LABEL_0
        id_1 = #id_2 1;
      end
      1: id_1 = id_1;
    endcase
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  bufif0 primCall (id_1, id_2, id_3);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2;
  id_1(
      .id_0(id_2), .id_1(1), .id_2()
  );
  logic [7:0] id_3;
  always @(id_1 or id_2) id_2 = id_2;
  wire id_4;
  assign id_3[1] = 1'h0;
  module_0 modCall_1 ();
endmodule
