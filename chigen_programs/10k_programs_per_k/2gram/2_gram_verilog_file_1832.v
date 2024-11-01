// Seed: 1360129329
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
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  if (1) begin
    always_ff id_4 <= id_9;
  end else begin
    uwire id_11;
    tri0  id_12;
    assign id_8 = id_11;
    wire id_13;
    id_14 :
    assert property (@(1'b0 == 1) id_10)
    else begin
      id_3 <= id_9;
    end
    always
      assume (id_12)
        @(posedge 1, "" - {1 / 1, id_4 == (!id_14), (1), id_1} or posedge id_11)
          @(posedge id_10 - 1)
            id_7 = id_14;
  end
  module_0(
      id_10, id_10, id_10, id_10, id_5, id_10, id_10
  );
endmodule
