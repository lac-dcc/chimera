// Seed: 3451052703
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_6;
  module_0(
      id_3, id_1, id_1, id_2, id_1, id_1
  );
  always @(posedge id_3)
    if (1'h0)
      if (1)
        #1 begin
          $display(1'b0, id_3);
        end
      else id_5 <= id_6;
endmodule
