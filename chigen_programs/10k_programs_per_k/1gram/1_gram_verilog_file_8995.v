// Seed: 3159160686
module module_0;
  assign id_1 = 1'd0;
  id_2 :
  assert property (@(posedge 1 or 1) 1) id_1 <= id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_4;
  module_0();
  always_ff begin
    id_4 <= id_3;
    if (1'b0) @(posedge id_4) #1 id_4 = id_4;
    else @(posedge id_4) id_2 <= (1 == 1);
  end
endmodule
