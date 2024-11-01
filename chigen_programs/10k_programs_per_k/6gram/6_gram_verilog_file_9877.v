// Seed: 3937036060
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  initial $display((1), 1);
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
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  assign id_6 = id_4;
  always #1 begin
    assign id_6 = id_8[1];
  end
  wire id_10;
  module_0(
      id_10, id_6
  );
  reg id_11;
  id_12(
      .id_0(id_4), .id_1(id_9), .id_2(1), .id_3(id_7)
  );
  always @(posedge id_12) id_1 <= #1 id_11;
  always @(1 - 1 or posedge 1) $display;
  wire id_13;
endmodule
