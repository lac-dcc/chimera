// Seed: 2602748916
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  id_9(
      .id_0(id_7[1]), .id_1(id_8), .id_2(id_5), .id_3(id_6)
  );
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
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_7;
  wire id_8;
  module_0(
      id_8, id_8, id_5, id_8, id_4, id_8, id_7
  );
  always @(posedge id_7[1'b0]) begin
    repeat (id_6) id_6 = #1 id_2;
  end
endmodule
