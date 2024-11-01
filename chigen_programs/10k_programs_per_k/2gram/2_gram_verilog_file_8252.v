// Seed: 3124984779
module module_0;
  wire id_1;
endmodule
macromodule module_1 (
    id_1
);
  input wire id_1;
  always begin
    id_2 <= id_1;
    $display(1, id_1 == 1, 1'b0);
  end
  module_0();
endmodule
module module_2 (
    input  tri1 id_0#(.id_4(1), .id_5("")),
    input  tri0 id_1,
    output tri1 id_2
);
  tri1 id_6;
  module_0();
  assign id_6 = id_1;
  wire id_7;
  wire id_8;
endmodule
module module_3 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
  initial begin
    if (id_2)
      fork
        id_1 = 1;
        id_2 = 1;
      join_any : id_3
    else begin
      if (id_3[1 : 1] ? 1'b0 : id_2) id_1 <= #1 1'h0;
      else begin
        id_2 = id_3[1];
      end
    end
  end
  module_0();
endmodule
