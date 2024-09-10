// Seed: 1288840153
module module_0 #(
    parameter id_2 = 32'd26,
    parameter id_4 = 32'd72,
    parameter id_5 = 32'd36
) (
    id_1,
    _id_2,
    id_3
);
  input id_3;
  output _id_2;
  input id_1;
  logic _id_4 = ~{id_1{id_2}};
  reg   _id_5 = id_3;
  task id_6;
    begin
      id_3 <= id_5;
    end
  endtask
  defparam id_7.id_8 = id_6;
  logic id_9;
  assign id_5[id_4#(.id_2(1)) [1]] = id_4[id_5];
  assign id_3[1'b0] = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd62
) (
    input _id_1,
    input id_2,
    input reg id_3,
    input logic id_4,
    input id_5,
    input logic id_6,
    input logic id_7
);
  logic id_8;
  initial begin : id_9
    id_3[id_1] <= id_1;
    #1;
  end
endmodule
