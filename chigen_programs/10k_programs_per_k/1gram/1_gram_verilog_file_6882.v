// Seed: 238869725
module module_0;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_12;
  module_0();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_1 = id_6;
  reg id_7;
  reg id_8;
  assign id_3 = 1;
  initial begin
    id_7 = id_4;
  end
  module_0();
  initial
    @(posedge 1) begin
      fork
        begin
          id_8 <= id_7;
        end
        id_7 = 1;
      join_any
    end
  wire id_9;
  wire id_10;
endmodule
