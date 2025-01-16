// Seed: 1705461944
module module_0;
  uwire id_2, id_3, id_4 = 1'b0, id_5, id_6, id_7;
  wire id_8;
  always return 1'b0;
  always begin : LABEL_0
    id_1 <= id_2 & 1;
    assert (1)
      if (-1'b0)
        if (id_4 ? -1 : 1) @(*) id_6 = (1 - id_4);
        else begin : LABEL_0
          begin : LABEL_0
            id_5 = -1;
          end
        end
  end
  always_latch $display;
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    output tri0 id_4
);
  localparam id_6 = !id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  id_7(
      .id_0(id_6), .id_1(-1), .id_2(id_4), .id_3(1'b0), .id_4(id_1 & id_1)
  );
  wire id_8;
endmodule
