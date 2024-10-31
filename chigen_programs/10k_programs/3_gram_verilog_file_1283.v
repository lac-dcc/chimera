// Seed: 1654108438
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  genvar id_6;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1
    , id_8,
    input wor id_2,
    output wor id_3,
    output supply0 id_4,
    input supply1 id_5,
    input tri id_6
);
  module_0(
      id_8, id_8, id_8, id_8, id_8
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_8, id_9, id_10 = id_8;
  assign id_4[1] = id_2;
  supply0 id_11;
  module_0(
      id_2, id_2, id_2, id_2, id_7
  );
  assign id_9 = 1;
  reg id_12;
  logic [7:0] id_13;
  assign id_5 = 1;
  always @(posedge id_13) id_1 <= id_11 && 1;
  always #1 begin
    @(posedge 1 or 1'b0) begin
      fork
        id_9 <= id_12;
        id_3 <= id_3;
      join
    end
    assert (id_7);
    disable id_14;
    if (1)
      fork
        disable id_15;
        #1 id_13[1] <= ~1;
      join : id_16
    id_11 = id_14;
  end
  wire id_17;
endmodule
