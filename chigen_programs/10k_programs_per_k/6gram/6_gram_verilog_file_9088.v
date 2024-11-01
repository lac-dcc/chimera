// Seed: 299056348
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  module_0(
      id_2, id_1
  );
  wire id_3;
endmodule
module module_2 (
    output tri0 id_0,
    output tri1 id_1
);
  id_3(
      .id_0(id_0), .id_1(1), .id_2(1'h0), .id_3(id_0), .id_4(id_1(1'b0))
  );
  initial begin
    #id_4;
    assume (1);
  end
endmodule
module module_3 (
    output wand  id_0,
    output wire  id_1,
    input  wand  id_2,
    input  uwire id_3,
    output wand  id_4,
    output tri0  id_5
);
  assign #id_7 id_0 = 1'b0;
  module_2(
      id_0, id_5
  );
endmodule
