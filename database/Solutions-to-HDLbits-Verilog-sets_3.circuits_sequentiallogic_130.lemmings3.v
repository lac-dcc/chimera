module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    localparam [2:0] WALK_L = 3'b000,
                     WALK_R = 3'b001,
                     FALL_L = 3'b010,
                     FALL_R = 3'b011,
                     DIG_L  = 3'b100,
                     DIG_R  = 3'b101;

    reg [2:0] state, next;

    always @(posedge clk or posedge areset) begin
        if(areset) state <= WALK_L;
        else state <= next;
    end

    always @(*) begin
        case(state)
            WALK_L : begin
                if(!ground) next = FALL_L;
                else begin
                    if(dig) next = DIG_L;
                    else begin
                        if(bump_left) next = WALK_R;
                        else next = WALK_L;
                    end
                end
            end
            WALK_R : begin
                if(!ground) next = FALL_R;
                else begin
                    if(dig) next = DIG_R;
                    else begin
                        if(bump_right) next = WALK_L;
                        else next = WALK_R;
                    end
                end
            end
            FALL_L : next = (ground) ? WALK_L : FALL_L;
            FALL_R : next = (ground) ? WALK_R : FALL_R;
            DIG_L  : next = (ground) ? DIG_L : FALL_L;
            DIG_R  : next = (ground) ? DIG_R : FALL_R;
        endcase
    end

    assign walk_left = (state == WALK_L);
    assign walk_right = (state == WALK_R);
    assign aaah = ((state == FALL_L) || (state == FALL_R));
    assign digging = ((state == DIG_L) || (state == DIG_R));

endmodule
