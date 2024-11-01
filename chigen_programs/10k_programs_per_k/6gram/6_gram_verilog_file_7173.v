// Seed: 2690163314
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg id_6;
  wor id_7 = 1'b0;
  always @(posedge id_3 or posedge 1) begin
    fork
      begin
        if (1'b0 == id_7) begin
          #1 id_1 = id_2;
        end
      end
      begin
        id_6 <= 1 - id_5;
      end
    join
  end
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
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  id_15(
      .id_0(~id_10), .id_1(id_8[1!=1] < "" + id_12), .id_2(1), .id_3(id_7)
  );
  xor (id_4, id_11, id_13, id_8, id_14, id_12, id_7, id_1, id_6, id_15);
  module_0(
      id_1, id_12, id_12, id_4, id_9
  );
endmodule
