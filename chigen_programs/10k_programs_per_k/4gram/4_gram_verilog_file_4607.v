// Seed: 292517120
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  wire module_0;
  wire id_7, id_8;
  id_9(
      .id_0(id_4), .id_1(1), .id_2(id_7), .id_3(id_7 & 1)
  );
  always @* begin
    #1;
    id_1 <= 1;
    wait (1);
  end
  id_10 :
  assert property (@(posedge "") id_10)
  else $display(1, 1 - 1'h0, 1'd0);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  final begin
    if (1) begin
      id_1 <= id_4;
    end
  end
  reg  id_8 = id_4;
  wire id_9;
  assign id_6 = id_3;
  module_0(
      id_4, id_9, id_9, id_9, id_9
  );
  assign id_1 = id_8;
  id_10(
      .id_0(1), .id_1(), .id_2(id_6), .id_3(1)
  );
  assign id_6 = id_3 - 1;
  assign id_8 = 1;
endmodule
