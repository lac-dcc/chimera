// Seed: 295102846
module module_0;
  always_latch disable id_1;
  module_3();
endmodule
module module_1;
  wire id_1;
  module_0();
endmodule
module module_2;
  tri0 id_1 = 1;
  module_0();
endmodule
module module_3;
  assign id_1 = id_1;
endmodule
module module_4 #(
    parameter id_13 = 32'd55,
    parameter id_14 = 32'd47
) (
    input uwire id_0,
    input logic id_1
);
  always @(posedge 1) begin
    if (id_1) id_3 <= id_1;
    else begin
      if (id_0) begin
        if (1'b0) disable id_4;
        else cover (1 == id_0);
        repeat (id_4) begin
          if (id_1)
            if (id_0) $display(id_4, 1'b0, id_4);
            else id_4 <= 1;
          else id_3 = #1 1;
          id_3 <= id_1;
          id_3 <= 1'b0;
          if (1) id_4 = 1;
          else id_3 = id_3;
        end
      end else begin
        id_3 <= 1;
      end
    end
    id_3 <= #id_3 id_1;
  end
  initial begin
    disable id_5;
  end
  module_3();
  always @(negedge 1 == 1) begin
    id_6 = id_0;
  end
  supply0 id_7, id_8, id_9, id_10, id_11;
  assign id_9 = 1;
  wire id_12;
  defparam id_13.id_14 = id_1 * 1 + (1'b0);
  wire id_15;
  always @(*);
endmodule
