// Seed: 2771972032
module module_0;
  id_2(
      .id_0(1), .id_1(1'h0), .id_2(id_1)
  );
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge module_1) if (id_2 + 1) id_1 = id_3;
  module_0();
endmodule
module module_2 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2,
    input  wire  id_3,
    input  wire  id_4,
    output logic id_5
);
  initial begin
    id_5 <= 1;
    id_2 += id_4;
    if ("") id_5 <= id_0;
  end
  module_0();
  wire id_7;
  always
  fork : id_8
    id_8 <= #1 id_1 - 1;
    id_9;
    begin
      #1 $display(id_1, ~id_1);
      id_2 <= id_1;
    end
  join : id_10
endmodule
