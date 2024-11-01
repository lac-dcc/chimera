// Seed: 3790676256
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  id_10(
      .id_0(), .id_1(id_4), .id_2(1), .id_3(1'b0), .id_4(id_7)
  );
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
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge "") begin
    id_3 <= "";
    if (id_3) begin
      disable id_10;
    end
  end
  id_11 :
  assert property (@(id_6[1]) id_3++)
  else begin
    id_5 = id_3;
  end
  assign id_2 = id_1;
  module_0(
      id_11, id_1, id_11, id_11, id_11, id_8, id_7, id_11, id_11
  );
  always @(1 or posedge id_1 ? 1 : id_8) begin
    id_5 = id_9;
  end
  wire id_12;
endmodule
