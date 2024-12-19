// Seed: 2100909982
module module_0;
  id_1(
      .id_0(1'b0), .id_1(id_2), .id_2(1 && id_2)
  );
  assign module_3.id_2 = 0;
endmodule
module module_1;
  module_0 modCall_1 ();
  assign id_1[1] = id_1;
  wire id_3;
  wire id_4;
endmodule
module module_2 (
    input tri0  id_0,
    input uwire id_1
);
  wire id_3;
  module_0 modCall_1 ();
  always #0 begin : LABEL_0
    if (id_1) begin : LABEL_0
      cover (1);
    end
  end
  wire id_4;
endmodule
module module_3 (
    input  wor  id_0,
    output wor  id_1,
    input  wire id_2
);
  assign id_1 = 1;
  module_0 modCall_1 ();
  id_4(
      .id_0(1), .id_1(id_2), .id_2(1), .id_3(1)
  );
endmodule
