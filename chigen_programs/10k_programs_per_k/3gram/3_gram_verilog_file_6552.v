// Seed: 2870406951
module module_0 ();
  assign id_1 = 1'h0;
  wire id_2;
  wire id_3;
  wire id_4;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  assign id_2 = id_6[(1-1)];
  wire id_12;
  id_13(
      .id_0(1 & 1'b0), .id_1(id_7), .id_2(1)
  ); id_14 :
  assert property (@(1) id_14)
  else begin
    id_10 <= 1;
    id_5  <= #1 id_3 || 1;
    if (id_14) assert (1'h0);
  end
  assign id_1[1] = id_6;
  module_0();
endmodule
