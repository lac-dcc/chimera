// Seed: 1990290716
module module_0 (
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
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  always_latch @* id_3 = 1;
  assign id_4 = 1;
endmodule
module module_1;
  reg id_1, id_2;
  always begin
    id_1 = id_2;
    begin
      if (id_1) id_1 <= 1;
      id_1 <= 1;
      id_1 = id_2;
      id_2 = id_1 | 1'b0;
      #1 id_1 <= "";
      if (1'b0) id_2 = 1;
    end
    id_1 <= id_2;
    id_1 = 1;
  end
  assign id_1 = 1 | id_2 > 1'b0;
  wire id_3, id_4;
  wire id_5;
  assign id_5 = 1'h0;
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_4, id_3, id_5, id_4, id_5
  );
  wire id_6, id_7;
endmodule
