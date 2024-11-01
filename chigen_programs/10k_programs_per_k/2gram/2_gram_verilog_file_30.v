// Seed: 2719664854
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_6;
  always id_8 = 1;
  assign id_4 = id_6;
endmodule
module module_1;
  wire id_2;
  module_0(
      id_2, id_2, id_2, id_2, id_2, id_2, id_2, id_2
  );
endmodule
module module_2 (
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_17;
  module_0(
      id_17, id_5, id_14, id_17, id_16, id_5, id_8, id_13
  );
  assign id_8 = id_1;
  initial begin
    #1 begin
      if (id_11) id_12 = id_15;
      else begin
        id_10 <= 1'b0;
        id_15 <= 1;
        id_8 = 1;
      end
      id_6 <= 1'b0;
    end
  end
endmodule
