// Seed: 3422288270
module module_0 (
    output id_0,
    input id_1,
    output id_2,
    input reg id_3,
    input logic id_4,
    input logic id_5
);
  always if (1) id_2 <= id_3;
  always begin
    #1;
  end
  type_13(
      1'd0, id_2
  );
  always
    if (id_5) id_0 <= 1;
    else begin
      id_2 <= 1;
    end
  type_0 id_6 (
      .id_0(id_5),
      .id_1(id_2),
      .id_2(SystemTFIdentifier)
  );
  type_14 id_7 (
      .id_0(id_1),
      .id_1(1),
      .id_2(1 - id_5),
      .id_3(id_3),
      .id_4(id_4),
      .id_5(""),
      .id_6(id_0 + 1),
      .id_7(1)
  );
  logic id_8;
  logic id_9;
  type_17(
      1
  );
endmodule
function [id_4[1] : 1] id_6;
  reg [1 'b0 : id_5[1  <  1 : ( "" )]] id_7;
  input [1 : id_6] id_8;
  @(posedge id_4 or id_4) begin
    reg [1  !=  id_9 : id_4] id_10 (
        .id_0 (id_2),
        .id_1 (1),
        .id_2 (1),
        .id_3 (1 - id_4),
        .id_4 ("" - id_2 == 1),
        .id_5 (1),
        .id_6 (id_3),
        .id_7 (id_8[id_5]),
        .id_8 (id_2),
        .id_9 (1 == SystemTFIdentifier(1'b0, 1)),
        .id_10(id_5)
    );
  end
endfunction
