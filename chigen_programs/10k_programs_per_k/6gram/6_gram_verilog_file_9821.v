// Seed: 3912246322
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  reg id_4 = id_3;
  logic [7:0] id_5;
  assign id_4 = id_1;
  assign id_3 = id_5[1];
  wire id_6;
  reg  id_7;
  always id_4 <= #1 1;
  assign id_7 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_5;
  module_0(
      id_5, id_4, id_5
  );
  always @(posedge 1) begin
    id_4 = 1'h0;
    id_3 <= id_5;
    #0;
    disable id_6;
  end
endmodule
