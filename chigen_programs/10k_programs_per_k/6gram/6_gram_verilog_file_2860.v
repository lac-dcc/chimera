// Seed: 2444458400
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_3;
  supply0 id_4;
  supply0 id_5;
  generate
    for (id_6 = 1'd0; id_4; id_5 = 1) begin : LABEL_0
      genvar id_7;
      id_8(
          .id_0(1'b0), .id_1(1), .id_2(1), .id_3(id_3[1 : 1]), .id_4(id_3)
      );
    end
  endgenerate
endmodule
module module_1 (
    input tri0 id_0,
    input tri id_1,
    output tri0 id_2,
    output tri id_3,
    output supply0 id_4
);
  assign id_3 = 1;
  not primCall (id_4, id_1);
  tri id_6;
  module_0 modCall_1 (
      id_6,
      id_6
  );
  assign modCall_1.id_6 = 0;
  initial
    forever begin : LABEL_0
      begin : LABEL_0
        cover (1 == 1);
        wait (id_6);
        id_6 = id_6;
      end
    end
endmodule
