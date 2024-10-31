// Seed: 573413647
module module_0;
  id_2(
      .id_0(1),
      .id_1(1),
      .id_2(id_1[1'b0]),
      .id_3(id_1),
      .id_4(),
      .id_5(1),
      .id_6(1),
      .id_7('b0),
      .id_8(1'd0),
      .id_9(id_3 ? 1 : id_4),
      .id_10(id_4)
  );
  initial begin
    if (1) id_4 <= id_3;
  end
  id_5(
      !1'b0, ""
  );
  wire id_6, id_7;
  wire id_8, id_9, id_10, id_11, id_12;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    output logic id_2,
    output wire id_3,
    input logic id_4,
    output uwire id_5,
    input logic id_6,
    input wand id_7,
    input supply0 id_8
    , id_17,
    input tri0 id_9,
    input logic id_10,
    input tri id_11,
    input tri1 id_12,
    input logic id_13,
    output logic id_14,
    output logic id_15
    , id_18
);
  if (1) begin
    always_comb @(posedge id_6, 1)
      @(posedge id_4 or id_13)
        if ({id_11, id_11 - 1'b0, (~1), 1, 1}) begin
          id_15 <= id_12 ? (1'd0) : 1'b0;
          wait (1 - 1);
        end else if (id_8) begin
          id_14 <= 1;
          if (1) id_5 = 1;
          id_0 = 1 <-> 1;
          id_2 <= (~id_8);
          do if (1) id_15 = id_13; while (1);
          id_0 <= 1'b0;
          id_2 = 1;
          id_18 <= id_6;
          id_0  <= id_4;
          if (id_1) id_14 = 1;
        end
    always_ff begin
      id_18 = 1'b0;
    end
    always begin
      id_14 <= id_10;
      id_14 <= 1;
    end
  end else wire id_19;
  module_0();
  wire id_20;
endmodule
