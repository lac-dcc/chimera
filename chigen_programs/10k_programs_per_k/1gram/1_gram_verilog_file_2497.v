// Seed: 3236771935
macromodule module_0;
  wire id_1;
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1
);
  module_0();
endmodule
module module_2 (
    input supply0 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input logic id_3,
    input wand id_4
);
  always id_1 = id_2;
  module_0();
  logic id_6, id_7;
  reg id_8;
  always $display(1'b0);
  wire id_9;
  always id_8 <= id_6;
  genvar id_10;
  generate
    id_11(
        (id_3), id_7, 1
    );
    begin
      begin
        always_comb $display(1);
      end
    end
  endgenerate
  assign id_1 = id_10;
  id_12(
      .id_0(1), .id_1(1), .id_2(1)
  );
endmodule
