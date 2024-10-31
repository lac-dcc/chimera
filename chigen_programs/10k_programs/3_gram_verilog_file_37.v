// Seed: 548134570
module module_0;
  always @(*) id_1 = 1;
  logic [7:0] id_2;
  assign id_2[1'd0-1 : 1] = 1;
endmodule
module module_1;
  module_0();
endmodule
module module_2;
  wire id_1;
  module_0();
  wire id_2, id_3;
endmodule
module module_3 (
    output logic id_0,
    output logic id_1,
    output logic id_2,
    input  logic id_3,
    input  logic id_4
);
  always
  fork
    if (id_3) begin
      if (1) id_0 <= 1;
      else begin
        id_2 <= 1;
      end
      id_0 <= id_3;
    end
    if (id_4)
      fork
        #1;
        if (1 ? 1 : 1) id_2 <= id_4;
        id_2 = 1;
        id_1 <= id_3;
        id_1 = 1;
        if (id_4) begin
          id_0 <= id_4;
          id_1 = 1;
        end
        $display;
        id_0 <= 1;
      join_none
  join_none
  module_0();
  always @(id_3 or id_4);
endmodule
