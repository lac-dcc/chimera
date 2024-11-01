// Seed: 713304865
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_4 = id_3;
  module_0(
      id_3, id_6, id_6
  );
  reg  id_9;
  wire id_10;
  id_11 :
  assert property (@(posedge id_9) 1'b0)
  else begin
    id_2[1] <= id_9;
    id_5 = 1;
  end
endmodule
