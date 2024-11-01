// Seed: 2220279669
module module_0;
  wire id_1;
  wire id_2;
  module_2();
endmodule
module module_1 ();
  assign id_1 = 1;
  module_0();
endmodule
module module_2;
  wire id_1;
  wire id_2;
  wire id_3;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4 = id_2;
  module_2();
  supply0 id_5 = 1;
  wire id_6 = id_3;
endmodule
module module_4 (
    output wire id_0,
    input  tri0 id_1
);
  assign id_0 = 1'b0;
  tri1 id_3, id_4;
  assign id_3 = 1'b0 > id_1;
  logic [7:0] id_5;
  wire id_6;
  assign (highz1, strong0) id_5[1] = 1;
  always_ff @(1) begin
    disable id_7;
  end
  module_2(); id_8(
      .id_0(id_4), .id_1(1 - |id_3), .id_2(1), .id_3(1)
  );
endmodule
