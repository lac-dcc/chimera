// Seed: 1355452473
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
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  initial begin
    wait (1) begin
      id_4 = new;
      id_9 = 1;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin
    #1 begin
      id_3 <= 1 + 1;
      id_3 <= id_2;
    end
  end
  wire id_4;
  module_0(
      id_4, id_4, id_4, id_3, id_4, id_4, id_4, id_4, id_4, id_4
  );
endmodule
