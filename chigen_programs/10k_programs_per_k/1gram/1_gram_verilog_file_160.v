// Seed: 1701122406
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  assign module_2.id_7 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output tri0 id_1,
    input  tri  id_2
);
  genvar id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
  assign id_4 = (id_4);
endmodule
module module_2 ();
  wire id_1, id_2;
  tri id_3, id_4;
  for (id_5 = id_4; 1 ? 1 : 1'h0; id_3 = 1) begin : LABEL_0
    wire id_6;
    assign id_3 = id_3;
    tri id_7;
    assign id_7 = 1;
    begin : LABEL_0
      logic [7:0][1] id_8 (
          .id_0(id_3),
          .id_1(1 - 1),
          .id_2(1)
      );
    end
  end
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_6,
      id_4
  );
endmodule
