// Seed: 2567176833
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  wire id_9;
  reg  id_10;
  assign id_3 = id_2 ? 1 : {1{1}};
  initial begin
    id_7 <= id_10;
    id_7 <= id_10 < id_7;
  end
endmodule
module module_1;
  wire id_2;
  reg  id_3;
  module_0(
      id_2, id_2, id_2, id_2, id_2, id_2, id_3
  );
  always @(1'b0 == 1 or 'b0) id_1 = #0 id_3;
  wire id_4 = id_2;
endmodule
