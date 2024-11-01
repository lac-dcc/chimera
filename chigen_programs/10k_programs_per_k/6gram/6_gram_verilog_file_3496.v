// Seed: 3907419774
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_7(
      .id_0(id_3 - 1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_6;
  module_0(
      id_5, id_5, id_3, id_4, id_1, id_5
  );
  assign id_5 = 1;
  always @(posedge id_4) begin
    #(~id_1) #1;
    if (1) id_5 = id_3;
    if (1 + id_3) id_2 <= 1'h0;
    id_6 <= id_2 <= 1;
  end
endmodule
