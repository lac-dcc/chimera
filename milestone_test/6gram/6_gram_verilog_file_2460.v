// Seed: 602174173
module module_0 #(
    parameter id_2 = 32'd3,
    parameter id_4 = 32'd19,
    parameter id_5 = 32'd70,
    parameter id_7 = 32'd68
) (
    id_1,
    _id_2
);
  input _id_2;
  input id_1;
  logic id_3 (.id_0(id_1));
  assign id_2 = id_1;
  logic _id_4 = 1;
  logic _id_5;
  initial begin
    id_5 <= id_2;
    if (1) id_4 <= id_4[1 : id_5];
    else id_4 <= (id_2);
  end
  type_18 id_6;
  pulldown (weak0) ("", 1, id_4);
  assign id_2[1'h0] = id_5 == 1'h0;
  always @(posedge id_3 - 1) begin
    _id_7(id_1);
    if (id_3[1]) begin
      id_2 <= 1;
      id_4 <= 1;
      if (id_2)
        if (id_2) begin
          id_3 <= id_4;
        end else begin
          wait (1) begin
            if (id_7)
              if (1) id_2 <= id_4;
              else begin
                id_5[id_4] = {1, id_4};
              end
          end
          id_5 = 1;
          id_3[id_7 : 1] = 1;
          if (1) begin
            if (id_5) id_7[1] <= 1;
            id_7 = id_4[id_2];
            if (1) id_7 <= id_3;
            else begin
              id_3 <= 1;
              id_7 <= #1 1;
              id_5 = 1;
              SystemTFIdentifier(id_6, 1);
              id_6 <= id_2;
              id_3 <= id_2;
              id_7 <= id_7;
              id_6 = id_3;
              id_1 = id_3;
              id_7 = id_3;
              id_7 = id_4;
              id_7 <= 1;
              #1 id_6 <= #1 1;
              #id_8;
              id_7 <= 1;
              id_7[^id_2] <= id_3 ? 1 : id_4;
              assign id_4 = (id_4) === 1;
              id_3 = 1 * 1 - 1;
              id_8 = 1'b0;
              id_2 <= 1;
              id_7 <= id_7[id_7[id_4] : 1'b0] - id_5;
              id_8 <= id_7 != 1'b0;
              #1 id_1 = 1;
              id_3 = 1;
              id_7 <= 1 === 1 == id_5;
              SystemTFIdentifier(id_7);
              id_5 <= 1;
            end
          end
        end
    end else begin
      id_6 <= id_2[1];
    end
  end
  reg   id_9;
  logic id_10 = 1'h0;
  type_21 id_11, id_12;
  logic id_13;
  logic id_14;
  type_24(
      1'h0, 1, id_9
  );
  assign id_3[1] = SystemTFIdentifier(id_6);
  timeunit 1ps;
  initial
    #1 begin
      if (id_9) begin
        SystemTFIdentifier(id_2, id_1);
        for (id_1 = id_4; id_10; id_11 = id_4) begin
          id_9 <= 1;
        end
      end
    end
endmodule
module module_1 #(
    parameter id_1 = 32'd24
);
  always @(id_1 or ~id_1) begin
    id_1 = 1 || id_1[id_1];
    id_1 = 1;
    id_1 <= id_1;
    id_1 = (1);
    if (1) if (1) id_1 = id_1 * 1'b0 - 1;
    id_1 <= #id_2 "";
    id_1 <= id_1 - 1'h0;
    @(negedge id_2[1]) id_2 <= 1;
    id_2 <= id_1;
    if (1'd0 ^ 1) assume (1 || 1 || 1);
    id_2 <= 1;
    id_1 <= id_2;
    id_2 <= 1;
    id_2 = 1'h0;
  end
endmodule
