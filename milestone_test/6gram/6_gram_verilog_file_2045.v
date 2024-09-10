// Seed: 4045494021
module module_0 #(
    parameter id_2 = 32'd35
) (
    input _id_2,
    output reg id_3,
    output id_4,
    input reg id_5
    , id_6,
    input id_7,
    input logic id_8,
    input id_9,
    output logic id_10,
    input reg id_11
);
  always @(posedge id_5 or posedge id_9 | (1)) begin
    if (id_10 == id_7) begin
      id_11 <= 1 ? 1 : id_5;
      id_8 = (1 == id_10 - id_3);
      #1 id_4 = 1;
      if (id_6) begin
        if (id_8) id_4 <= 1;
        else if (id_7[id_2]) id_1 <= id_9;
      end
      if (id_11) id_1[1] <= !(1);
      else id_3 <= id_6;
    end
  end
  type_0 id_12 (
      .id_0(id_3),
      .id_1(id_10[1 : 1] == id_10),
      .id_2(""),
      .id_3(1),
      .id_4(1)
  );
  assign id_10[1] = 1;
  type_18(
      id_5, {1'b0, 1} == id_5, 1
  );
endmodule
