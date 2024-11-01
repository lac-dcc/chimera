// Seed: 3796735708
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_6;
  for (id_7 = 1; id_1; id_5 = id_7) begin : id_8
    wire id_9;
  end
  reg id_10;
  always begin
    wait (1);
    {1, ~^1 + id_10} = id_2;
    id_10 <= id_6[1*~1 : 1'b0];
    id_10 = 1'h0;
  end
  id_11 :
  assert property (@(posedge 1) id_10)
  else;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always begin
    id_3 <= id_5;
    id_2 <= id_2;
  end
  module_0(
      id_6, id_1, id_1, id_4, id_1
  );
endmodule
