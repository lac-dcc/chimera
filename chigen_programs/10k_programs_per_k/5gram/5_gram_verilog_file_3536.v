// Seed: 3077959888
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_15;
  wire id_16;
  id_17(
      .id_0(id_16), .id_1(1)
  );
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_6;
  assign id_3 = id_6;
  reg id_7;
  assign id_4 = id_3;
  always @(posedge id_6, posedge id_6) #0;
  supply0 id_8;
  assign id_8 = id_1++;
  assign id_5[1] = id_6 ? 1 : ~id_4;
  reg id_9;
  reg id_10;
  always @(id_9 or posedge id_3) begin
    if (1) begin
      $display(id_10, id_9, id_9 != id_8, 1'b0);
    end else begin
      id_4 <= id_7;
    end
  end
  assign id_6 = id_10;
  id_11(
      .id_0(1), .id_1(id_6), .id_2(id_5[1]), .id_3((id_4)), .id_4(id_3)
  ); module_0(
      id_8, id_2, id_8, id_2, id_8, id_8, id_8, id_8, id_1, id_8, id_8, id_8, id_1, id_1
  );
  supply1 id_12 = 1;
endmodule
